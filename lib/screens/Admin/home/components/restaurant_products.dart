import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/core/components/item_tile_vertical.dart';

import '../../../../core/components/item_tile_horizontal.dart';
import '../../../../core/constants/constants.dart';
import 'package:firebase_database/firebase_database.dart';

class RestaurantProducts extends StatelessWidget {
  const RestaurantProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDefaults.padding),
          child: Column(
            children: [
              SizedBox(height: 75),
              Text(
                'Tus productos son',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 64, 77),
                    fontSize: 25),
              ),
              /*Text(
                '(Japanese Food)',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.grey),
              ),*/
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: StreamBuilder(
            stream: FirebaseDatabase.instance
                .ref()
                .child('Comidas/${user.uid}')
                .onValue,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                // Obtiene una lista de Mapas de los datos de Firebase
                List<Map<dynamic, dynamic>> foodsList = [];
                Map<dynamic, dynamic> foods = snapshot.data!.snapshot.value;
                foods.forEach((key, value) {
                  foodsList.add(value);
                });

                // Crea una lista de ItemTileHorizontal a partir de los datos de Firebase
                List<ItemTileVertical> itemTiles = [];
                for (var food in foodsList) {
                  itemTiles.add(
                    ItemTileVertical(
                      foodName: food['name'],
                      description: food['descripcion'],
                      imageUrl: food['imageUrl'],
                      price: food['precio'],
                    ),
                  );
                }

                return Column(
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
