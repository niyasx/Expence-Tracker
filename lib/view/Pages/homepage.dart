
import 'package:expense_tracker/viewmodel/Functions/firebase_service.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:expense_tracker/viewmodel/providers/homepageprovider.dart';
import 'package:expense_tracker/model/list_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'expense.dart';
import 'income.dart';

class HomePage extends StatefulWidget {
  final MainBoard mainBoard;
   const HomePage({super.key, required this.mainBoard});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownvalue = 'October';

  @override
  void initState() {
    getValue();
    super.initState();
  }

  void getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.mainBoard.mainbalance = prefs.getInt('mainbalance') ?? 0;
      widget.mainBoard.finalincome = prefs.getInt('finalincome') ?? 0;
      widget.mainBoard.finalexpense = prefs.getInt('finalexpence') ?? 0;
    });
  }

  // List of items in our dropdown menu
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'Septumber',
    'October',
    'November',
    'December',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 246, 229, 1),
        elevation: 0,
        leading:  Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: InkWell(
            onTap: () {
              FirebaseServices().googleSignOut();
              FirebaseAuth.instance.signOut().then((value) {
                print('Signed out');
                Navigator.pop(context);
              });
            },
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 200, 20, 188),
              child: CircleAvatar(
                radius: 20.5,
                backgroundImage: AssetImage('assets/image/profile.png'),
              ),
            ),
          ),
        ),
        title: SizedBox(
          width: 160,
          height: 45,
          child: DropdownButtonFormField(
            borderRadius: BorderRadius.circular(20),
            elevation: 0,
            value: dropdownvalue,
            iconSize: 0,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(0),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      width: .1,
                      color: Color.fromRGBO(127, 61, 255, 1),
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                        width: .1, color: Color.fromRGBO(127, 61, 255, 1))),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Image.asset(
                    'assets/image/arrow down 2.png',
                    width: 10,
                  ),
                )),
            alignment: Alignment.center,
            items: months.map((String monthsitem) {
              return DropdownMenuItem(
                value: monthsitem,
                child: Text(monthsitem),
              );
            }).toList(),
            onChanged: (monthsitem) {
              Provider.of<Homepageprovider>(context,listen: false).monthpro(monthsitem!);
            },
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 6),
            child: IconButton(
              onPressed: () {

              },
              icon: const Icon(
                CupertinoIcons.bell_fill,
                size: 30,
                color: Color.fromARGB(255, 123, 4, 174),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromRGBO(255, 246, 229, 1),
                      Color.fromRGBO(248, 237, 216, 0),
                    ],
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Account Balance',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(145, 145, 159, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      '${widget.mainBoard.mainbalance}',
                      style: GoogleFonts.inter(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(22, 23, 25, 1)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Income(
                                          mainBoard: widget.mainBoard,
                                        )));
                          },
                          child: Container(
                            width: 164,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: const Color.fromRGBO(0, 168, 107, 1)),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  bottom: 15,
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color.fromRGBO(
                                            252, 252, 252, 1)),
                                    child: Image.asset(
                                      'assets/image/income.png',
                                      color:
                                          const Color.fromRGBO(0, 168, 107, 1),
                                      cacheWidth: 32,
                                      cacheHeight: 32,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 17,
                                  left: 80,
                                  child: Text(
                                    "Income",
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFCFCFC),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 38,
                                  left: 75,
                                  child: Text(
                                    "${widget.mainBoard.finalincome}",
                                    style: GoogleFonts.inter(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFCFCFC),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Expense(
                                          mainBoard: widget.mainBoard,
                                        )));
                          },
                          child: Container(
                            width: 164,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: const Color.fromRGBO(253, 60, 74, 1)),
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  bottom: 15,
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color.fromRGBO(
                                            252, 252, 252, 1)),
                                    child: Image.asset(
                                      'assets/image/expence.png',
                                      color:
                                          const Color.fromRGBO(253, 60, 74, 1),
                                      cacheWidth: 32,
                                      cacheHeight: 32,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 17,
                                  left: 80,
                                  child: Text(
                                    "Expence",
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFFCFCFC),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 38,
                                  left: 75,
                                  child: Text(
                                    "${widget.mainBoard.finalexpense}",
                                    style: GoogleFonts.inter(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFFCFCFC),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Spend Frequency',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0D0E0F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 3.6,
              child: LineChart(LineChartData(
                  minX: 0,
                  minY: 0,
                  maxX: 6,
                  maxY: 6,
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                        spots: const [
                          FlSpot(0, 1.4),
                          FlSpot(1, 2.7),
                          FlSpot(1.8, .9),
                          FlSpot(2.5, 3.5),
                          FlSpot(3.5, 1.8),
                          FlSpot(4.5, 6.2),
                          FlSpot(5.3, 2),
                          FlSpot(6, 2)
                        ],
                        color: const Color.fromRGBO(127, 61, 255, 1),
                        barWidth: 6,
                        dotData: const FlDotData(show: false),
                        isCurved: true,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(196, 174, 241, 1),
                                Color.fromRGBO(255, 255, 255, 1)
                              ]),
                        ),
                        curveSmoothness: 0.4)
                  ])),
            ),
            Container(
              height: 45,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(35.0)),
              child: DefaultTabController(
                length: 4,
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: const Color(0xFFFCEED4)),
                  tabs: const [
                    Tab(text: 'Today'),
                    Tab(text: 'Week'),
                    Tab(text: 'Month'),
                    Tab(text: 'Year'),
                  ],
                  labelColor: const Color(0xFFFCAC12),
                  unselectedLabelColor: const Color(0xFF91919F),
                ),
              ),
            ),
            Container(
              height: 56,
              width: 375,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Recent Transactions',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF292B2D),
                      ),
                    ),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xFFEEE5FF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 0,
                          side: const BorderSide(width: 0.01)),
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF7F3DFF),
                        ),
                      ))
                ],
              ),
            ),
            const SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: 300,
                  child: HistoryList(),
                  // child: RecentTransaction(mainBoard: widget.mainBoard)))
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(127, 61, 255, 1),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 35,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
