import 'package:flutter/material.dart';

import '../../../core/components/item_tile_horizontal.dart';
import '../../../core/constants/constants.dart';

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
          child: Row(
            children: const [
              ItemTileHorizontal(
                foodName: 'Fresh Tamagoyaki',
                description: 'A delicious egg food from Japan.',
                imageUrl: 'https://i.imgur.com/JRWxyhP.png',
              ),
              ItemTileHorizontal(
                foodName: 'Okonomiyaki',
                description: 'Unagi is the Japanese w',
                imageUrl: 'https://i.imgur.com/WTjq9wQ.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
