import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import 'resturant_tile.dart';

class NearbyResturants extends StatelessWidget {
  const NearbyResturants({
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
                'Big discount resto ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '(nearby)',
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
              ResturantTile(),
              ResturantTile(),
              ResturantTile(),
            ],
          ),
        )
      ],
    );
  }
}
