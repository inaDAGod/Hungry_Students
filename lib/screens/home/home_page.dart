import 'package:flutter/material.dart';
import 'package:rive_animation/screens/home/components/home_suggestions_restaurants.dart';

import 'components/home_category_selection.dart';
import 'components/home_greetings.dart';
import 'components/home_header.dart';
import 'components/home_suggestions.dart';
import 'components/home_suggestions_restaurants.dart';

import 'components/sponsored_resturants.dart';
import '../../core/components/search_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeGreetings(),
            //SearchBox(),
            //CategorySelection(),
            HomeSuggestionSection(),
            SizedBox(height: 16),
            SponsoredResturants(),
            HomeSuggestionSectionRestaurants(),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
