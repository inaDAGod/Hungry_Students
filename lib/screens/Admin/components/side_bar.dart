import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/Admin/entry_point_admin.dart';
import 'package:rive_animation/screens/Admin/products_page.dart';
import 'package:rive_animation/screens/onboding/components/auth_page.dart';

import '../../../model/menu.dart';
import '../../../utils/rive_utils.dart';
import '../update_info_restaurant.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                //debemos pasarle un nombre por bd
                name: "Pipocas Cato",
                bio: "Administradora",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Opciones".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sidebarMenus3
                  .map((menu) => SideMenu(
                        menu: menu,
                        selectedMenu: selectedSideMenu,
                        press: () {
                          RiveUtils.chnageSMIBoolState(menu.rive.status!);
                          setState(() {
                            selectedSideMenu = menu;
                            if(menu.title.toString() == 'Inicio'){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const EntryPointAdmin()));
                            }
                            if(menu.title.toString() == 'Restaurante'){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const ActualizarInfoRestaurante()));
                            }
                            if(menu.title.toString() == 'Productos'){
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const ProductsPage()));
                            }
                            if(menu.title.toString() == 'Cerrar sesión'){
                              FirebaseAuth.instance.signOut();
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const AuthPage()));
                            }
                          });
                          
                        },
                        riveOnInit: (artboard) {
                          menu.rive.status = RiveUtils.getRiveInput(artboard,
                              stateMachineName: menu.rive.stateMachineName);
                        },
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
