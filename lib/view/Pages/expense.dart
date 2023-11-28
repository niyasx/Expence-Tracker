import 'package:dotted_border/dotted_border.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:expense_tracker/viewmodel/providers/expenceprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

class Expense extends StatelessWidget {
  final MainBoard mainBoard;
   Expense({super.key,required this.mainBoard});

  final myController = TextEditingController();
  

  void myExpence() {
    String incomevalue = myController.text;
    int finalIncomeValue = int.parse(incomevalue);
    mainBoard.expensecarrier(finalIncomeValue);
  }

  // bool sw(){
  //   bool isswitched=false;
  // return isswitched;
  // }

  // List of items in our dropdown menu
  final category= [
    'Shopping',
    'Food',
    'Subscription',
    'Movie',
    'Bills',
    'Rent',
  ];

  final payment= [
    // 'Wallet',
    'Gpay',
    'PhonePay',
    'Paypal',
    'Card Payment',
    'Net Banking',
  ];

  final attachment= [
    'Photo',
    'Video',
    'Audio',
    'Documents',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 60, 74, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);},
            icon: Image.asset('assets/image/arrow left.png')),
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            'Expense',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 26,
              top: 65,
            ),
            child: Opacity(
              opacity: 0.64,
              child: Text(
                'How Much?',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFBFBFB)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 26,
              top: 95,
            ),
            child: Text(
              '\$',
              style: GoogleFonts.inter(
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFBFBFB)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 66,
              top: 82,
            ),
            child: TextField(
              controller: myController,
              style: GoogleFonts.inter(
                  fontSize: 64,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFFBFBFB)),
              showCursor: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: GoogleFonts.inter(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFFBFBFB))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 194),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 528,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(20),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    width: .1,
                                    color: Color.fromARGB(255, 125, 125, 125))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    width: .1,
                                    color: Color.fromARGB(255, 137, 137, 139))),
                          ),
                          elevation: 0,
                          icon: Image.asset(
                            'assets/image/arrow down 2.png',
                            scale: .7,
                            color: const Color.fromRGBO(145, 145, 159, 1),
                          ),
                          hint: Text(
                            'Category',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF91919F)),
                          ),
                          items: category.map((String categoryvalue) {
                            return DropdownMenuItem( 
                              value: categoryvalue,
                              child: Text(categoryvalue),
                            );
                          }).toList(),
                          onChanged: (categoryvalue) {
                            Provider.of<ExpenceProvider>(context).categorypro(categoryvalue!);
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    width: .1,
                                    color: Color.fromARGB(255, 125, 125, 125))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    width: .1,
                                    color: Color.fromARGB(255, 137, 137, 139))),
                            hintText: 'Discription',
                            hintStyle: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF91919F))),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: DropdownButtonFormField(
                          borderRadius: BorderRadius.circular(20),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    width: .1,
                                    color: Color.fromARGB(255, 125, 125, 125))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                    width: .1,
                                    color: Color.fromARGB(255, 137, 137, 139))),
                          ),
                          elevation: 0,
                          icon: Image.asset(
                            'assets/image/arrow down 2.png',
                            scale: .7,
                            color: const Color.fromRGBO(145, 145, 159, 1),
                          ),
                          hint: Text(
                            'Wallet',
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF91919F)),
                          ),
                          items: payment.map((String paymentvalue) {
                            return DropdownMenuItem(
                              value: paymentvalue,
                              child: Text(paymentvalue),
                            );
                          }).toList(),
                          onChanged: (paymentvalue) {
                            Provider.of<ExpenceProvider>(context).paymentpro(paymentvalue!);
                          }),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 18, left: 20, right: 20),
                      child: DottedBorder(
                        color: const Color.fromARGB(255, 137, 137, 139),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(16),
                        strokeWidth: .1,
                        dashPattern: const [8, 6],
                        padding: const EdgeInsets.only(left: 80),
                        child: DropdownButtonFormField(
                            alignment: Alignment.centerLeft,
                            borderRadius: BorderRadius.circular(20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(16),
                              prefixIcon: Image.asset(
                                'assets/image/attachment.png',
                                color: const Color.fromRGBO(145, 145, 159, 1),
                              ),
                            ),
                            iconSize: 0,
                            elevation: 0,
                            hint: Text(
                              'Add attachment',
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF91919F)),
                            ),
                            items: attachment.map((String attachitem) {
                              return DropdownMenuItem(
                                value: attachitem,
                                child: Text(attachitem),
                              );
                            }).toList(),
                            onChanged: (attachitem) {
                              Provider.of<ExpenceProvider>(context).attachmentpro(attachitem!);
                            }),
                      ),
                    ),
                    Stack(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 32, left: 20, right: 20),
                          child: SizedBox(
                            height: 60,
                            width: 350,
                          ),
                        ),
                        Positioned(
                          left: 32,
                          top: 40,
                          child: Text(
                            'Repeat',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF292B2D),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 32,
                          top: 60,
                          child: Text(
                            'Repeat Transaction',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF91919F),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 35,
                            top: 50,
                            child: FlutterSwitch(
                              value:Provider.of<ExpenceProvider>(context).isSwitched,
                              width: 46,
                              height: 24,
                              toggleSize: 24.0, 
                              borderRadius: 30.0,
                              padding: 0.1,
                              activeColor: Colors.grey,
                              onToggle: (notSelected) {
                                Provider.of<ExpenceProvider>(context,listen:false
                                ).switchpro();
                              },
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 36,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: SizedBox(
                          width: 350,
                          height: 56,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(127, 61, 255, 1))),
                              onPressed: () {
                                myExpence();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(mainBoard:mainBoard,)));
                              },
                              child: Text(
                                'Continue',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFFCFCFC),
                                ),
                              )),
                        ),
                      ),
                    )
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
