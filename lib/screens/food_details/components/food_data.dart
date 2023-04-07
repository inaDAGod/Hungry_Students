import 'package:flutter/material.dart';

import '../../../core/components/network_image.dart';
import '../../../core/constants/constants.dart';

class FoodData extends StatelessWidget {
  const FoodData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: const AspectRatio(
              aspectRatio: 1 / 1,
              child: NetworkImageWithLoader('https://i.imgur.com/LiVMyhg.png'),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fresh Tamagyoki',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),

              // Total Reviews
              Row(
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star_rounded,
                        color: Colors.orangeAccent,
                        size: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '(431)',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  )
                ],
              ),
            ],
          ),

          /// Add To Order Button
          const Spacer(),
          OutlinedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.add_rounded, size: 16),
                SizedBox(width: 4),
                Text('Add to order'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
