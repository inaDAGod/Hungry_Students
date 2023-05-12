import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/RestaurantList/Lista.dart';
import 'package:rive_animation/screens/home/home_page.dart';
import 'package:rive_animation/screens/infoUsuario/informacionUsuario.dart';
import 'package:rive_animation/utils/rive_utils.dart';

import '../../model/menu.dart';
import '../home/home_page.dart';
import 'components/btm_nav_item.dart';
import 'components/menu_btn.dart';
import 'components/side_bar.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  bool isSideBarOpen = false;

  Menu selectedBottonNav = bottomNavItems.first;
  Menu selectedSideMenu = sidebarMenus.first;
List<Widget> pages = [
  HomePage(),
  Lista(),
  Lista(),
  Lista(),
  ProfilePage(),
  Lista(),
  // Agregue otras páginas aquí según sea necesario
];
int Pageindex=0;
  late SMIBool isMenuOpenInput;

  void updateSelectedBtmNav(Menu menu, int index) {
  if (selectedBottonNav != menu) {
    setState(() {
      selectedBottonNav = menu;
      Pageindex = index;
    });
  }
}

  late AnimationController _animationController;
  late Animation<double> scalAnimation;
  late Animation<double> animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(
        () {
          setState(() {});
        },
      );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(
                  1 * animation.value - 30 * (animation.value) * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child:  ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
        child: pages[Pageindex],
                  // pages[
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100 * animation.value),
        child: SafeArea(
          child: Container(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: backgroundColor2.withOpacity(0.8),
                  offset: const Offset(0, 20),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavItems.length,
                  (index) {
                    Menu navBar = bottomNavItems[index];
                    return  BtmNavItem(
                    navBar: navBar,
                    press: () {
                      RiveUtils.chnageSMIBoolState(navBar.rive.status!);
                      updateSelectedBtmNav(navBar, index);
                    },
                    riveOnInit: (artboard) {
                      navBar.rive.status = RiveUtils.getRiveInput(artboard,
                          stateMachineName: navBar.rive.stateMachineName);
                    },
                    selectedNav: selectedBottonNav,
                  );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}