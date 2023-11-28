import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  bool isSwitched = false;
  // List of items in our dropdown menu
  var items = [
    'Shopping',
    'Food',
    'Subscription',
    'Movie',
    'Bills',
    'Rent',
  ];
  var items2 = [
    // 'Wallet',
    'Gpay',
    'PhonePay',
    'Paypal',
    'Card Payment',
    'Net Banking',
  ];
  var items3 = [
    'Photo',
    'Video',
    'Audio',
    'Documents',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0077FF),
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
            'Transfer',
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
              top: 215,
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
              top: 245,
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
              top: 232,
            ),
            child: TextField(
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
            padding: const EdgeInsets.only(top: 344),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 378,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 166,
                                height: 60,
                                child: TextField(
                                  showCursor: false,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              width: .1,
                                              color: Color.fromARGB(
                                                  255, 125, 125, 125))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              width: .1,
                                              color: Color.fromARGB(
                                                  255, 137, 137, 139))),
                                      hintText: 'From',
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF91919F))),
                                ),
                              ),
                              SizedBox(
                                width: 166,
                                height: 60,
                                child: TextField(
                                  showCursor: false,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              width: .1,
                                              color: Color.fromARGB(
                                                  255, 125, 125, 125))),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          borderSide: const BorderSide(
                                              width: .1,
                                              color: Color.fromARGB(
                                                  255, 137, 137, 139))),
                                      hintText: 'To',
                                      hintStyle: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF91919F))),
                                ),
                              ),
                            ],
                          ),
                        ),  
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 15, left: 20, right: 20),
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
                                items: items3.map((String item3) {
                                  return DropdownMenuItem(
                                    value: item3,
                                    child: Text(item3),
                                  );
                                }).toList(),
                                onChanged: (h) {}),
                          ),
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
                                  onPressed: () {},
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
                    Positioned(
                      left: 177,
                      top: 30,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // color: Colors.brown,
                          ),
                          child: Image.asset('assets/image/transaction colored.png'),
                        
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
