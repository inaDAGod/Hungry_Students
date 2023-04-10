import 'package:flutter/material.dart';

import '../../../core/components/network_image.dart';

class ResturantTile extends StatelessWidget {
  const ResturantTile({
    Key? key, required this.name, required this.imageUrl, required this.description, required this.cal,
  }) : super(key: key);
  
  final String name;
  final String imageUrl;
  final String description;
  final String cal;
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
           SizedBox(
            width: 62,
            height: 70,
            child: NetworkImageWithLoader(imageUrl),
            ),
          
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: Theme.of(context).textTheme.caption?.copyWith(),
              ),
              const SizedBox(height: 8),
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
    );
  }
  
 
}
