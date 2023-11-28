
// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:expense_tracker/utils/reuable_widgets.dart';
import 'package:expense_tracker/view/Pages/homepage.dart';
import 'package:expense_tracker/viewmodel/Functions/firebase_service.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_countdown/slide_countdown.dart';

class VerificationPage extends StatelessWidget {
  final String email;
  final String password;
  final String res;
  final String name;
  VerificationPage(
      {super.key,
      required this.email,
      required this.password,
      required this.res,
      required this.name});

  final otpcontrol = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text('Verification',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212224))),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 195,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: Text(
                    'Enter your Verification Code',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF0D0E0F),
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const SlideCountdownSeparated(
              countUpAtDuration: true,
              duration: Duration(
                minutes: 5,
              ),
            ),
            const SizedBox(height: 53),
            OtpInput(otpcontrol, () {}),
            const SizedBox(
              height: 83,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'We send verification code to your \nemail',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF212224),
                  )),
              TextSpan(
                  text: email,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7E3DFF),
                  )),
              TextSpan(
                  text: '. You can check your inbox.',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF212224),
                  ))
            ])),
            const SizedBox(
              height: 20,
            ),
            Text(
              'I didin\'t recieve the code ? Send again',
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF7E3DFF),
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 56,
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: ElevatedButton(
                onPressed: () async {
                  var status = await EmailOTP().verifyOtp(res, otpcontrol.text);
                  if (status == 'success') {
                    try {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email, password: password)
                          .then((value) {
                             DateBaseServices().addUser(fullName: name, email:email).then((value) {
                    print('data has saved');
                  });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(mainBoard: MainBoard())));
                        print('Created Account');
                      }).onError((error, stackTrace) {
                        print('error ${error.toString()}');
                      });
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "The password provided is too weak.")));
                      } else if (e.code == 'email-already-in-use') {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "The account already exists for that email.")));
                      } else if (e.code == 'invalid-email') {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("The entered email is invalid")));
                      } else if (e.code == "user-not-found") {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "The entered email is not registered with us")));
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('incorrect otp')));
                  }
                },
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(127, 61, 255, 1)),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                child: Text(
                  'Verify',
                  style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
