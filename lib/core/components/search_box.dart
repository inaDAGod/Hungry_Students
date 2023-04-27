import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.grey.shade200,
          
          filled: true,
          hintText: 'Buscar',
          prefixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(AppIcons.search),
          ),
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(width: 0.1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(width: 0.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(width: 0.1),
          ),
          prefixIconConstraints: const BoxConstraints(maxWidth: 48),
        ),
      ),
    );
  }
}
