import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class HomeInfo extends StatefulWidget {
  const HomeInfo({
    Key? key,
  }) : super(key: key);

  @override
  _HomeInfoState createState() => _HomeInfoState();
}

class _HomeInfoState extends State<HomeInfo> {
  late String descripcion="";

  @override
  void initState() {
    super.initState();
    _loadDescripcion();
  }

  Future<void> _loadDescripcion() async {
    final user = FirebaseAuth.instance.currentUser!;
    final ref = FirebaseDatabase.instance.ref();
    final des = await ref.child('Restaurantes/${user.uid}').get();
    if (des.child('descripcion').exists) {
      log("esta2");
      // ignore: avoid_print
      print(des.child('descripcion').value);
      setState(() {
        descripcion = des.child('descripcion').value.toString();
      });
    } else {
      setState(() {
        descripcion = "Aun no tienes una descripcion";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${user.displayName}',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              descripcion,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      ),
    );
  }
}
