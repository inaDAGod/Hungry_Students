import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../screens/food_details/food_details.dart';

import '../constants/constants.dart';
import 'network_image.dart';

class ItemTileVertical extends StatelessWidget {
  const ItemTileVertical({
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
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FoodDetailsPage()));
        },
        borderRadius: AppDefaults.borderRadius,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            borderRadius: AppDefaults.borderRadius,
            gradient: LinearGradient(
              colors: [
                const Color(0xFF62B9BF),
                const Color(0xFF7BC5C6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.0,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: ClipRRect(
                      borderRadius: AppDefaults.borderRadius,
                      child: NetworkImageWithLoader(imageUrl),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  flex: 2,
                  
                  child: Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: [
                      
                      Text(
                        foodName,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/heart_filled.svg',
                            color: Colors.white,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Calificación:',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$cal/5',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
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
