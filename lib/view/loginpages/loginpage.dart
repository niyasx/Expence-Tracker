import 'package:expense_tracker/utils/reuable_widgets.dart';
import 'package:expense_tracker/view/Pages/homepage.dart';
import 'package:expense_tracker/view/loginpages/signup_page.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final loginemailcontroller = TextEditingController();
  final loginpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              'Login',
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF212224)),
            ),
          ),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 56),
            child: SizedBox(
                height: 56,
                width: 350,
                child: reusableTextField(loginemailcontroller, 'Email', false)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 24),
            child: SizedBox(
              height: 56,
              width: 350,
              child: TextFormField(
                obscureText: true,
                obscuringCharacter: '*',
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF90909F)),
                controller: loginpasswordcontroller,
                onFieldSubmitted: (value) {
                  value = loginpasswordcontroller.toString();
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF90909F)),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.eye),
                      color: const Color.fromRGBO(145, 145, 159, 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: .5,
                        color: Color(0xFFF1F1FA),
                        strokeAlign: BorderSide.strokeAlignCenter,
                      )),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 40),
              child: custombutton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: loginemailcontroller.text,
                        password: loginpasswordcontroller.text)
                    .then((value) {
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) =>
                              HomePage(mainBoard: MainBoard())));
                });
              })),
          const SizedBox(
            height: 33,
          ),
          InkWell(
            onTap: () {
            },
            child: Text(
              'Forgot Password',
              style: GoogleFonts.inter(
                decoration: TextDecoration.underline,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF7E3DFF),
              ),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account yet?',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF90909F),
                  )),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      CupertinoPageRoute(builder: (context) => const SignUpPage()));
                },
                child: Text(' Sign Up',
                    style: GoogleFonts.inter(
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7E3DFF),
                    )),
              )
            ],
          )
        ]));
  }
}
