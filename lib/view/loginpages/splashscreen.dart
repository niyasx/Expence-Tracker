import 'dart:async';

import 'package:expense_tracker/view/loginpages/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WelcomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
      body: Center(
        child: Stack(
          children: [
            Opacity(
              opacity: .8,
              child: Padding(
                padding: const EdgeInsets.only(left: 27),
                child: Container(
                    width: 80,
                    height: 80,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Image.asset('assets/image/eclipse.png')),
              ),
            ),
            Text('montra',
                style: GoogleFonts.inter(
                    fontSize: 56,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
