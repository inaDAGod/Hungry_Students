import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../screens/food_details/food_details.dart';

import '../constants/constants.dart';
import 'network_image.dart';

class ItemTileVerticalSuggestion extends StatelessWidget {
  const ItemTileVerticalSuggestion(  {
    Key? key,
    required this.foodName,
    required this.imageUrl,
    required this.description,
    required this.cal,
  }) : super(key: key);

  final String foodName;
  final String imageUrl;
  final String description;
  final String cal;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        /*onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FoodDetailsPage()));
        },*/
        borderRadius: AppDefaults.borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          //Aca empieza los datos de cada ITEM
          child: Container(
            margin: const EdgeInsets.only(bottom: 16), // add space between items
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: NetworkImageWithLoader(imageUrl),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded( 
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        foodName,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          
                          const Text('Promedio Calificación:'),
                          const Spacer(),
                          
                           Row(
                            children: List.generate(
                              int.parse(cal),
                              (index) => const Icon(
                                Icons.star_rounded,
                                color: Colors.orangeAccent,
                                size: 16,
                              ),
                            ),
                           )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
