import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/screens/entryPoint/entry_point.dart';
import 'package:rive_animation/screens/home/home_page.dart';
//import 'package:rive_animation/screens/entryPoint/entry_point.dart';
import 'package:rive_animation/screens/onboding/components/entry_point_pruebita.dart';
import 'package:rive_animation/screens/onboding/onboding_screen.dart';

import '../../RestaurantList/Lista.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            //Direcciona a la pagina despues de inicio de sesion
            return const EntryPoint();
          }

          // user is NOT logged in
          else {
            return const EntryPoint(); // ----> cambiar a pagina de sign up (una que pregunte si es cato o restaurante)
          }
        },
      ),
    );
  }
}
