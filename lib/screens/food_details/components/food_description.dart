import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class FoodDescription extends StatelessWidget {
  const FoodDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding,
        vertical: AppDefaults.padding / 2,
      ),
      child: Text(
        'Tamagoyaki is a type of Japanese omelette, which is made by rolling together several layers of cooked egg.These are often prepared in a rectangular omelette pan called a makiyakinabe or tamagoyakiki.',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey,
              height: 1.5,
            ),
      ),
    );
  }
}
