import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';

import '../../values/values.dart';
import '../../widgets/dark_background/dark_radial_background.dart';
import '../../widgets/form/form_input_with _label.dart';
import '../../widgets/navigation/back.dart';
import '../../widgets/shapes/background_hexagon.dart';

import 'signup.dart';

class EmailAddressScreen extends StatefulWidget {
  const EmailAddressScreen({super.key});

  @override
  State<EmailAddressScreen> createState() => _EmailAddressScreenState();
}

class _EmailAddressScreenState extends State<EmailAddressScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      DarkRadialBackground(
        color: HexColor.fromHex("#181a1f"),
        position: DarkRadialBackground.topLeft,
      ),
      Positioned(
          top: Utils.screenHeight / 2,
          left: Utils.screenWidth,
          child: Transform.rotate(
              angle: -math.pi / 2,
              child: CustomPaint(painter: BackgroundHexagon()))),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavigationBack(),
            const SizedBox(height: 40),
            Text("What's your\nemail\naddress?",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            AppSpaces.verticalSpace20,
            LabelledFormInput(
                placeholder: "Email",
                keyboardType: "text",
                controller: _emailController,
                obscureText: obscureText,
                label: "Your Email"),
            const SizedBox(height: 40),
            SizedBox(
              //width: 180,
              height: 60,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => SignUp(email: _emailController.text));
                  },
                  style: ButtonStyles.blueRounded,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email, color: Colors.white),
                      Text('   Continue with Email',
                          style: GoogleFonts.lato(
                              fontSize: 20, color: Colors.white)),
                    ],
                  )),
            )
          ],
        )),
      )
    ]));
  }
}
