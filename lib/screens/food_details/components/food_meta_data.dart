import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/network_image.dart';
import '../../../core/constants/constants.dart';

class FoodMetaData extends StatelessWidget {
  const FoodMetaData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Fresh Tamagoyaki',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '\$6.00',
                style: Theme.of(context).textTheme.headline6?.copyWith(),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Resturant Details
          Row(
            children: [
              const ResturantDetails(),

              const Spacer(),

              /// Discounted Price
              Text(
                '\$10.00',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Delivery Data
          Row(
            children: [
              SvgPicture.asset(AppIcons.time),
              const Text('10 min'),
              const Spacer(),
              SvgPicture.asset(AppIcons.stars),
              const Text('4.5'),
              const Spacer(),
              SvgPicture.asset(AppIcons.delivery),
              const Text('Free Delivery'),
              const Spacer(flex: 5),
            ],
          ),
        ],
      ),
    );
  }
}

class ResturantDetails extends StatelessWidget {
  const ResturantDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
          height: 20,
          child: NetworkImageWithLoader(
            'https://i.imgur.com/sHvxwmP.png',
          ),
        ),
        const SizedBox(width: 16),
        Row(
          children: [
            Text(
              'Totsuki Elite',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(width: 8),
            Row(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star_rounded,
                  color: Colors.orangeAccent,
                  size: 16,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
