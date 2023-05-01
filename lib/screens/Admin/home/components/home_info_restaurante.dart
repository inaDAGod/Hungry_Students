import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pipocas Don Pipo',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              'Las pipocas don pipo estan presentes cerca de la Universidad Catolica desde hace un anio, se destacan por sus economicos precios.',
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