import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Pruebita extends StatefulWidget {
  const Pruebita({super.key});

  @override
  State<Pruebita> createState() => _PruebitaState();
}

class _PruebitaState extends State<Pruebita> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  void correoVerificacion() {
    user.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
          child: Text(
        "LOGGED IN AS: ${user.displayName}",
        style: const TextStyle(fontSize: 20),
      )),
    );
  }
}
