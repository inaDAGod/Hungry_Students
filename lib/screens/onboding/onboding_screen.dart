import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
//import 'components/animated_btn.dart'; ---> no se esta usando
import 'components/sign_in_dialog.dart';
import 'components/sign_up_dialog.dart';
import 'components/sign_up_dialog_restaurant.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  bool isShowSignInDialog = false;
  bool isShowSignUpDialog = false;
  bool isShowSignUpResDialog = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
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
                          children: [
                            Text(
                              "Hungry Students",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: screenSize *
                                    0.06, // ajusta el tamaño de la fuente según el tamaño de la pantalla
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Todos los restaurantes alrededor de la universidad en un solo lugar.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                    const Center(),
                    const Divider(
                      color: Color.fromARGB(0, 109, 108, 107),
                    ),
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
                          backgroundColor: const Color.fromRGBO(255, 64, 64, 1),
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
                    const Center(
                      child: Text(
                        "REGISTRATE ",
                        style: TextStyle(
                          color: Color.fromARGB(178, 12, 6, 61),
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const Divider(
                      height: 15,
                      color: Color.fromARGB(0, 109, 108, 107),
                    ),
                    //boton para regristros -----------------------------------de estudiantes
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
                              const Color.fromARGB(251, 72, 219, 238),
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
                        child: const Text('Soy cato'),
                      ),
                    ),
                    const Divider(
                      height: 15,
                      color: Color.fromARGB(0, 109, 108, 107),
                    ),
                    //boton para regristros---------------------------- de restaurantees
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
                              const Color.fromARGB(251, 72, 219, 238),
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
                                isShowSignUpResDialog = true;
                              });
                              showCustomDialogUpRes(
                                context,
                                onValue: (_) {
                                  setState(() {
                                    isShowSignUpResDialog = false;
                                  });
                                },
                              );
                            },
                          );
                        }, //pagina para registrarse
                        child: const Text('Restaurante'),
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
