import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/constants.dart';

class HomeChip extends StatelessWidget {
  const HomeChip({
    Key? key,
    required this.name,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  final String name;
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isActive ? 8 : 4),
      child: Material(
        color: isActive ? AppColors.primary : null,
        borderRadius: BorderRadius.circular(32),
        child: InkWell(
          onTap: () {},
          borderRadius: AppDefaults.borderRadius,
          child: Container(
            padding: const EdgeInsets.all(AppDefaults.padding / 2),
            child: Row(
              children: [
                isActive
                    ? Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: SvgPicture.asset(icon, height: 16),
                      )
                    : const SizedBox(),
                Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: isActive ? Colors.black : Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
