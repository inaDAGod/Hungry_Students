import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
//import 'components/animated_btn.dart'; ---> no se esta usando
import 'components/sign_in_dialog.dart';
import 'components/sign_up_dialog.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  bool isShowSignInDialog = false;
  bool isShowSignUpDialog = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            //top: isShowSignUpDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Center(
                      child: SizedBox(
                        width: 260,
                        child: Column(
                          children: const [
                            Text(
                              "Hungry Students",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Todos los restaurantes alrededor de la universidad en un solo lugar.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    const Center(
                      child: Text(
                        "Ya tengo una cuenta ",
                        style: TextStyle(
                          color: Color.fromARGB(123, 12, 6, 61),
                          fontFamily: 'bold',
                          fontSize: 13,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Divider(),
                    Center(
                      child: ElevatedButton(
                        //ingresar con cuenta
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "bold",
                            height: 1.2,
                          ),
                          backgroundColor:
                              const Color.fromARGB(252, 59, 204, 223),
                          fixedSize: const Size(220, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Future.delayed(
                            const Duration(milliseconds: 40),
                            () {
                              setState(() {
                                isShowSignInDialog = true;
                              });
                              showCustomDialogIn(
                                context,
                                onValue: (_) {
                                  setState(() {
                                    isShowSignInDialog = false;
                                  });
                                },
                              );
                            },
                          );
                        },
                        child: const Text('Ingresar'),
                      ),
                    ),
                    const Divider(
                      height: 60,
                      color: Color.fromARGB(0, 109, 108, 107),
                    ),
                    const Center(
                      child: Text(
                        "¿Aun no tienes una cuenta? ",
                        style: TextStyle(
                          color: Color.fromARGB(123, 12, 6, 61),
                          fontFamily: 'bold',
                          fontSize: 13,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Divider(
                      height: 20,
                      color: Color.fromARGB(0, 109, 108, 107),
                    ),
                    //boton para regristros
                    Center(
                      child: ElevatedButton(
                        //ingresar con cuenta
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: "bold",
                            height: 1.2,
                          ),
                          backgroundColor:
                              const Color.fromARGB(252, 59, 204, 223),
                          fixedSize: const Size(220, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Future.delayed(
                            const Duration(milliseconds: 40),
                            () {
                              setState(() {
                                isShowSignUpDialog = true;
                              });
                              showCustomDialogUp(
                                context,
                                onValue: (_) {
                                  setState(() {
                                    isShowSignUpDialog = false;
                                  });
                                },
                              );
                            },
                          );
                        }, //pagina para registrarse
                        child: const Text('Registrarse'),
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
