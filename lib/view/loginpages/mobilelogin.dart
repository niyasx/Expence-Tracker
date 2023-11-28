import 'package:country_picker/country_picker.dart';
import 'package:expense_tracker/view/loginpages/otpscreen.dart';
import 'package:expense_tracker/viewmodel/Functions/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileLoginPage extends StatefulWidget {
  const MobileLoginPage({super.key});

  @override
  State<MobileLoginPage> createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> {
  PhoneAuth phoneAuth = PhoneAuth();

  final phonenumcontroller = TextEditingController();

  String verificationId = '';

  Country selctedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'india',
      example: 'india',
      displayName: 'india',
      displayNameNoCountryCode: 'IN',
      e164Key: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign In With Mobile',
          style: GoogleFonts.inter(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Continue with Mobile OTP",
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
           Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
                "Please enter your mobile number , we will send you an OTP to your mobile number.",
                style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 56,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              controller: phonenumcontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10.5, bottom: 10, right: 4),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500),
                          onSelect: (value) {
                            setState(() {
                              selctedCountry = value;
                            });
                          },
                        );
                      },
                      child: Text(
                        "${selctedCountry.flagEmoji} + ${selctedCountry.phoneCode}",
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black12)),
                  // border: InputBorder.none,
                  suffixIcon: TextButton(
                      onPressed: () {
                        phoneAuth
                            .verifyPhoneNumberrr(
                                "+${selctedCountry.phoneCode + phonenumcontroller.text}",
                                verificationId)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OtpScreen()));
                        });
                      },
                      child: const Text('Send Otp'))),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
