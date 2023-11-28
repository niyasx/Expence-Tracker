import 'package:expense_tracker/view/Pages/homepage.dart';
import 'package:expense_tracker/viewmodel/Functions/firebase_service.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  // final String verificationID;
  const OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  PhoneAuth phoneAuth = PhoneAuth();
  TextEditingController otpCode = TextEditingController();
  String verificationId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verification",
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Pinput(
                controller: otpCode,
                length: 6,
                showCursor: true,
                defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.purple.shade200)),
                    textStyle: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w600)),
                onSubmitted: (value) async {

                  print("submitted");
                  // try {
                  //   await FirebaseAuth.instance
                  //       .signInWithCredential(PhoneAuthProvider.credential(
                  //     verificationId: verificationId.toString(),
                  //     smsCode: value,
                  //   ));

                  //   Navigator.pushReplacement(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>
                  //               HomePage(mainBoard: MainBoard())));
                  // } catch (e) {
                  //   ScaffoldMessenger.of(context)
                  //       .showSnackBar(SnackBar(content: Text(e.toString())));
                  // }

                  // phoneAuth.signInWithPhoneNumber(otpCode.text,verificationId).then((value) {
                  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage(mainBoard: MainBoard())));
                  // });
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ElevatedButton(
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance
                        .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId:otpCode.text,
                      smsCode: otpCode.text,
                    ));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage(mainBoard: MainBoard())));
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: Text(
                  "Confirm",
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
  }
}
