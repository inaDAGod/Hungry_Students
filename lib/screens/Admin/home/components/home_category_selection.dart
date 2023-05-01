import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import 'home_category_chip.dart';

class CategorySelection extends StatelessWidget {
  const CategorySelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDefaults.padding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: AppDefaults.padding),
        child: Row(
          children: const [
            HomeChip(
              name: 'Breakfast',
              icon: AppIcons.anyfood,
              isActive: true,
            ),
            HomeChip(
              name: 'Lunch',
              icon: AppIcons.burger,
              isActive: false,
            ),
            HomeChip(
              name: 'Dinner',
              icon: AppIcons.eggroll,
              isActive: false,
            ),
            HomeChip(
              name: 'Snack',
              icon: AppIcons.pizza,
              isActive: false,
            ),
            HomeChip(
              name: 'Desert',
              icon: AppIcons.pizza,
              isActive: false,
            ),
            HomeChip(
              name: 'Drinks',
              icon: AppIcons.pizza,
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}
