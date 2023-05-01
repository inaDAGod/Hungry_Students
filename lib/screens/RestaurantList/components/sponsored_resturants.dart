import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import 'resturant_tile.dart';
import 'package:firebase_database/firebase_database.dart';

class SponsoredResturants extends StatelessWidget {
  const SponsoredResturants({
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
                'Espacio Publicitario ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '(Top 3)',
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
          child: Row(
            children: 
            [StreamBuilder(
              stream: FirebaseDatabase.instance.reference().child('Sponsored_Restaurants').onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  // Obtiene una lista de Mapas de los datos de Firebase
                  List<Map<dynamic, dynamic>> foodsList = [];
                  Map<dynamic, dynamic> foods = snapshot.data!.snapshot.value;
                  foods.forEach((key, value) {
                    foodsList.add(value);
                  });

                  // Crea una lista de ItemTileHorizontal a partir de los datos de Firebase
                  List<ResturantTile> itemTiles = [];
                  for (var food in foodsList) {
                    itemTiles.add(
                      ResturantTile(
                        name: food['name'],
                        description: food['description'],
                        imageUrl: food['imageUrl'],
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
          ],
            
          ),
        )
      ],
    );
  }
}
