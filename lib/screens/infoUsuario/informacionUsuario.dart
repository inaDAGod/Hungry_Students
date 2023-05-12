import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFC5CAE9),
            Color(0xFFE8EAF6),
            Color(0xFFE8F5E9), // Agregamos otro color al degradado
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 16),
            Text(user.displayName!, style: Theme.of(context).textTheme.headline6),
            Text(user.email!, style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Cambiamos el color del botón a rojo
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
