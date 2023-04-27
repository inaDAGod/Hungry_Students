import 'package:flutter/material.dart';
//import 'package:rive_animation/screens/entryPoint/entry_point.dart';
import 'package:rive_animation/screens/onboding/components/auth_page.dart';
//import 'package:rive_animation/screens/onboding/onboding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Obtiene una instancia de la base de datos
  //final database = FirebaseDatabase.instance.reference();
/*
      // Define el dato que se va a agregar a la base de datos
      Map<String, dynamic> data = {
        'name': 'Dona',
        'description': 'skaldjakjsdlkaj',
        'imageUrl':'https://images.ecestaticos.com/DiS5WxaZIGQm4ospyeo7E9Zi5r4=/0x118:2269x1393/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F8b5%2Fc1d%2F016%2F8b5c1d0163f7a26de81530b12e1e3a02.jpg',
        'cal':'3',
      };
      // Agrega el dato a la base de datos
      try {
        await database.child('Popular_Restaurants').push().set(data);
        print('Dato agregado a Firebase Realtime Database');
      } catch (e) {
        print('Error al agregar dato a Firebase Realtime Database: $e');
      }
*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEF1F8),
        primarySwatch: Colors.blue,
        fontFamily: "Intel",
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(height: 0),
          border: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          errorBorder: defaultInputBorder,
        ),
      ),
      home: const AuthPage(),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);