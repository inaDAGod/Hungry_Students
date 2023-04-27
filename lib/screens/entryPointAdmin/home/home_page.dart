import 'package:flutter/material.dart';

import 'components/home_category_selection.dart';
import 'components/home_greetings.dart';
import 'components/home_header.dart';
import 'components/home_suggestions.dart';
import 'components/home_info_restaurante.dart';
import '../../../core/components/search_box.dart';
import '../../../../core/constants/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
//import 'package:rive_animation/screens/entryPoint/entry_point.dart';
import 'package:rive_animation/screens/entryPointAdmin/entry_point_admin.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            //Parte superior
            const SizedBox(height: 40),
            const Text(
              //esta alineado a la patada
                "       Información Restaurante",
                style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color.fromARGB(255,255,64,77), fontSize: 25
                ),
                textAlign: TextAlign.center,
            ),

            //Restaurante nombre
            const SizedBox(height: 10),
            const Text(
                "Nombre:",
                style: TextStyle(
                  color: Colors.black54,
                ),
            ),
            TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.face,
                        color: Color.fromRGBO(255, 64, 64, 1),
                      ),
                    ),
                  ),
                ),
            //Descripcion
            const SizedBox(height: 10),
            const Text(
                "Descripcion:",
                style: TextStyle(
                  color: Colors.black54,
                ),
            ),
            TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.article,
                        color: Color.fromRGBO(255, 64, 64, 1),
                      ),
                    ),
                  ),
                ),
            //Dirección
            const SizedBox(height: 10),
            const Text(
                "Dirección:",
                style: TextStyle(
                  color: Colors.black54,
                ),
            ),
            TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.store,
                        color: Color.fromRGBO(255, 64, 64, 1),
                      ),
                    ),
                  ),
                ),

            //Boton 
            const SizedBox(height: 10),
            ElevatedButton.icon(
                  onPressed: () {
                    //singIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(255, 64, 64, 1),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color.fromARGB(255, 255, 252, 253),
                  ),
                  label: const Text(
                    "Actualizar",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
          ],
        ),
        ),
      ),
    );
  }
}
