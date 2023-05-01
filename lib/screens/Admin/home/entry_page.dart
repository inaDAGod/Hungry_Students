import 'package:flutter/material.dart';


import 'package:rive_animation/screens/Admin/home/components/home_suggestions.dart';
import 'package:rive_animation/screens/Admin/home/components/home_info_restaurante.dart';
import 'package:rive_animation/screens/Admin/home/components/home_greetings.dart';
import '../../../../../core/constants/constants.dart';
import 'components/restaurant_products.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDefaults.padding),
        child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            //Parte superior
            SizedBox(height: 20),
            HomeGreetings(),
            //Imagen
            SizedBox(height: 10),
            Image(
              image: NetworkImage('https://i.pinimg.com/736x/63/2a/72/632a72ded73004453ab2a6b965dff444.jpg'),
            ),
            //Titulo Negocio
            SizedBox(height: 10),
            HomeInfo(),
            //Se deberia mostrar sus productos disponibles
            SizedBox(height: 10),
            Text(
              'Algunos de tus productos son: ',
              style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Color.fromARGB(255,255,64,77)),

            ),

            //HomeSuggestionSection(),
            RestaurantProducts()
          ],
        ),
        ),
      ),
    );
  }
}
