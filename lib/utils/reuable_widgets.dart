import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

TextFormField reusableTextField(
    TextEditingController textcontroller, String text, bool passwordtype) {
  return TextFormField(
      textAlign: TextAlign.start,
      obscureText: passwordtype,
      obscuringCharacter: '*',
      style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF90909F)),
      controller: textcontroller,
      onFieldSubmitted: (value) {
        value = textcontroller.toString();
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: text,
        hintStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color.fromARGB(255, 177, 177, 177)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: .5,
              color: Color(0xFFF1F1FA),
              strokeAlign: BorderSide.strokeAlignCenter,
            )),
      ));
}

Container custombutton(BuildContext context, bool isLogin, Function ontap) {
  return Container(
    height: 56,
    width: MediaQuery.of(context).size.width-40,
    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
    child: ElevatedButton(
      onPressed: () {
        ontap();
      },
      style: ButtonStyle(
        backgroundColor:
            const MaterialStatePropertyAll(Color.fromRGBO(127, 61,255, 1)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ))
      ),
      child: Text(
        isLogin ? 'Log In ' : 'Sign Up',
        style: GoogleFonts.inter(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      ),
    ),
  );
}



Pinput OtpInput(TextEditingController otpController, Function onsub){
  return Pinput(
    controller: otpController,
    errorText: 'Error',
    errorTextStyle: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.red,
    ),
    keyboardType: TextInputType.number,
    length: 4,
    onSubmitted: (value) {
     onsub;
   },
   animationCurve:  Curves.bounceIn,
   


  );

}