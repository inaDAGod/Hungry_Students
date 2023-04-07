import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class FoodCategories extends StatelessWidget {
  const FoodCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            _CategoriesChip(name: 'Breakfast'),
            _CategoriesChip(name: 'Vegan'),
            _CategoriesChip(name: 'Japanese'),
          ],
        ),
      ),
    );
  }
}

class _CategoriesChip extends StatelessWidget {
  const _CategoriesChip({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: AppDefaults.borderRadius,
      ),
      child: Text(name),
    );
  }
}
