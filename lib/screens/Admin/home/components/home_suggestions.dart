import 'package:flutter/material.dart';

import '../../../../core/components/item_tile_horizontal.dart';
import '../../../../core/constants/constants.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeSuggestionSection extends StatelessWidget {
  const HomeSuggestionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: Row(
            children: [
              Text(
                'Suggestions for you ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '(Japanese Food)',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: StreamBuilder(
            stream: FirebaseDatabase.instance.reference().child('Popular_Dishes').onValue,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // Obtiene una lista de Mapas de los datos de Firebase
                List<Map<dynamic, dynamic>> foodsList = [];
                Map<dynamic, dynamic> foods = snapshot.data!.snapshot.value;
                foods.forEach((key, value) {
                  foodsList.add(value);
                });

                // Crea una lista de ItemTileHorizontal a partir de los datos de Firebase
                List<ItemTileHorizontal> itemTiles = [];
                for (var food in foodsList) {
                  itemTiles.add(
                    ItemTileHorizontal(
                      foodName: food['name'],
                      description: food['description'],
                      imageUrl: food['imageUrl'],
                      price: food['price'],
                      cal: food['cal'],
                    ),
                  );
                }

                return Row(
                  children: itemTiles,
                );
              } else if (snapshot.hasError) {
                return Text('Error al obtener datos de Firebase');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}