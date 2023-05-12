import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
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
              name: 'Almuerzo',
              icon: AppIcons.anyfood,
              isActive: true,
            ),
            HomeChip(
              name: 'Desayuno',
              icon: AppIcons.burger,
              isActive: false,
            ),
            HomeChip(
              name: 'Cena',
              icon: AppIcons.eggroll,
              isActive: false,
            ),
            
          ],
        ),
      ),
    );
  }
}
