
// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:expense_tracker/utils/reuable_widgets.dart';
import 'package:expense_tracker/view/Pages/homepage.dart';
import 'package:expense_tracker/view/loginpages/mobilelogin.dart';
import 'package:expense_tracker/view/loginpages/verificationpage.dart';
import 'package:expense_tracker/view/loginpages/loginpage.dart';
import 'package:expense_tracker/viewmodel/Functions/firebase_service.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
  }

  final fireobj = FirebaseServices();

  final myotp = EmailOTP();

  final namecontroller = TextEditingController();

  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  bool check = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Sign Up',
            style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF212224)),
          ),
        ),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 56),
                child: SizedBox(
                    height: 56,
                    width: 350,
                    child: reusableTextField(namecontroller, 'Name', false)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 24),
                child: SizedBox(
                    height: 56,
                    width: 350,
                    child: reusableTextField(emailcontroller, 'Email', false)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 24),
                child: SizedBox(
                    height: 56,
                    width: 350,
                    child: reusableTextField(
                        passwordcontroller, 'Password', true)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: check,
                      onChanged: (value) {
                        setState(() {
                          check = value!;
                        });
                      },
                      checkColor: const Color.fromRGBO(127, 61, 255, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: const Color.fromRGBO(127, 61, 255, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(127, 61, 255, 1),
                        width: 1.7,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 290,
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'By signing up, you agree to the',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: ' Terms of Service and Privacy Policy',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF7E3DFF),
                          ))
                    ])),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: custombutton(context, false, () async {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text)
                        .then((value) {
                      DateBaseServices()
                          .addUser(
                              fullName: namecontroller.text,
                              email: emailcontroller.text)
                          .then((value) {
                        print('data has saved');
                      });
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(mainBoard: MainBoard())));
                      print('Created Account');
                    });
                    var res = await EmailOTP().sendOtp(emailcontroller.text);
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => VerificationPage(
                                  email: emailcontroller.text,
                                  name: namecontroller.text,
                                  password: passwordcontroller.text,
                                  res: res,
                                )));
                  })),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Text(
                  'Or with',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF90909F),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  width: 350,
                  height: 56,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(238, 229, 255, 1))),
                      onPressed: () async {
                        await FirebaseServices().signinWithGoogle();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(mainBoard: MainBoard())));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/google.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign Up with Google',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF212224),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('Already have an account?',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF90909F),
                    )),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        CupertinoPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text('Login',
                      style: GoogleFonts.inter(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7E3DFF),
                      )),
                )
              ]),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 56,
                width: 340,
                child: TextButton(
                  onPressed: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MobileLoginPage()));
                  },
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(54, 53, 56, 1)),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)))),
                  child: Text(
                    'Login With Phone Number',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ), 
    );
  }
}
