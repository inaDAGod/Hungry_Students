import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:rive_animation/screens/Admin/home/components/home_suggestions.dart';
import 'package:rive_animation/screens/Admin/home/components/home_info_restaurante.dart';
import 'package:rive_animation/screens/Admin/home/components/home_greetings.dart';
import '../../../../../core/constants/constants.dart';
import 'components/restaurant_products.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  _EntryPage createState() => _EntryPage();
}

class _EntryPage extends State<EntryPage> {
  late String fotoRestaurante =
      "https://thumbs.dreamstime.com/z/icono-de-carga-color-aislado-en-fondo-blanco-barra-progreso-formas-din%C3%A1micas-aleatorias-gradiente-vector-ilustraci%C3%B3n-vectorial-181540424.jpg";

  @override
  void initState() {
    super.initState();
    _loadDescripcion();
  }

  Future<void> _loadDescripcion() async {
    final user = FirebaseAuth.instance.currentUser!;
    final ref = FirebaseDatabase.instance.ref();
    final des = await ref.child('Restaurantes/${user.uid}').get();
    if (des.child('imageUrl').exists) {
      log("esta14");
      // ignore: avoid_print
      print(des.child('imageUrl').value);
      setState(() {
        fotoRestaurante = des.child('imageUrl').value.toString();
      });
    } else {
      log("esta14");
      setState(() {
        fotoRestaurante =
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBAWjyd4WkkzS9hZJQjorMkmoUhh_6e-7mxg&usqp=CAU";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              HomeGreetings(),
              SizedBox(height: 10),
              Image(
                image: NetworkImage(fotoRestaurante),
              ),
              SizedBox(height: 10),
              HomeInfo(),
              SizedBox(height: 10),
              const Text(
                'Algunos de tus productos son: ',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 64, 77),
                ),
              ),
              HomeSuggestionSection()
            ],
          ),
        ),
      ),
    );
  }
}
