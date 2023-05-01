import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'components/home_category_selection.dart';
import 'components/home_greetings.dart';
import 'components/home_header.dart';
import 'components/home_suggestions.dart';
import 'components/home_suggestions_restaurants.dart';

import 'components/sponsored_resturants.dart';
import '../../core/components/search_box.dart';
class Lista extends StatelessWidget {
  const Lista({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
              bottom: false,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HomeGreetings(),
            SearchBox(),
            
            HomeSuggestionSection(),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}