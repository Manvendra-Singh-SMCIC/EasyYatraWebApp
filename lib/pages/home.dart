// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hotel_management_webapp/auth/auth_controller.dart';
import 'package:flutter_hotel_management_webapp/globals/global.dart';
import 'package:flutter_hotel_management_webapp/pages/login.dart';
import 'package:flutter_hotel_management_webapp/provider/page_rebuilder.dart';
import 'package:flutter_hotel_management_webapp/utilityWidgets/commonWidgets.dart';
import 'package:flutter_hotel_management_webapp/utilityWidgets/hostproperty.dart';
import 'package:flutter_hotel_management_webapp/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../utils/styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _primaryColor = const Color(0xFFE1F3FF);

  TextEditingController cityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String count1 = Global.RoomData[0].toString();
    String count2 = Global.RoomData[1].toString();
    String count3 = Global.RoomData[2].toString();
    Size _screenSize = MediaQuery.of(context).size;
    return Consumer<PageRebuilder>(
      builder: (context, pageRebuilder, child) {
        if (pageRebuilder.shouldRebuild) {
          Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
          pageRebuilder.shouldRebuild = false;
        }
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  _screenSize.width * 0.05,
                  _screenSize.height * 0.01,
                  _screenSize.width * 0.05,
                  _screenSize.height * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleBar(_screenSize),
                  _mainBanner(_screenSize),
                  Column(
                    children: [
                      ResponsiveBuilder(builder: (context, screensize) {
                        var searchActions = [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(10)),
                            width: 350,
                            child: ListTile(
                              leading: Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF222221),
                              ),
                              title: TextField(
                                controller: cityController,
                                onChanged: (value) {
                                  Global.city = value;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Enter a city or hotel',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          DeviceScreenType.desktop ==
                                  screensize.deviceScreenType
                              ? const SizedBox(
                                  width: 15,
                                )
                              : const SizedBox(
                                  height: 15,
                                ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final blueTheme = ThemeData(
                                    primaryColor: Colors.blue,
                                    colorScheme:
                                        ColorScheme.fromSwatch().copyWith(
                                      secondary: Colors.blueAccent,
                                    ),
                                  );

                                  var pickedDate = await showDateRangePicker(
                                    context: context,
                                    builder: (context, child) {
                                      return Column(
                                        children: [
                                          Theme(
                                            data: blueTheme,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth: 400,
                                                  maxHeight: 400,
                                                ),
                                                child: child,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    initialDateRange:
                                        Global.selectedDateRange ??
                                            Global.initialDateRange,
                                    firstDate: DateTime.now()
                                        .subtract(Duration(days: 1)),
                                    lastDate: DateTime(DateTime.now().year + 5),
                                  );
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDateStart =
                                        DateFormat('dd MMM yyyy')
                                            .format(pickedDate.start);
                                    String formattedDateEnd =
                                        DateFormat('dd MMM yyyy')
                                            .format(pickedDate.end);

                                    setState(() {
                                      Global.selectedDateRange = pickedDate;
                                      dateStart.text = formattedDateStart;
                                      dateEnd.text = formattedDateEnd;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 200,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.calendar_month,
                                      size: 20,
                                      color: Color(0xFF222221),
                                    ),
                                    title: TextField(
                                      controller: dateStart,
                                      readOnly: true,
                                      enabled: true,
                                      decoration: InputDecoration(
                                          hintText: DateFormat("dd MMM yyyy")
                                              .format(Global
                                                  .initialDateRange.start),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                              DeviceScreenType.desktop ==
                                      screensize.deviceScreenType
                                  ? const SizedBox(
                                      width: 15,
                                    )
                                  : const SizedBox(
                                      width: 15,
                                    ),
                              GestureDetector(
                                onTap: () async {
                                  final blueTheme = ThemeData(
                                    primaryColor: Colors.blue,
                                    colorScheme:
                                        ColorScheme.fromSwatch().copyWith(
                                      secondary: Colors.blueAccent,
                                    ),
                                  );

                                  var pickedDate = await showDateRangePicker(
                                    context: context,
                                    builder: (context, child) {
                                      return Column(
                                        children: [
                                          Theme(
                                            data: blueTheme,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth: 400,
                                                  maxHeight: 400,
                                                ),
                                                child: child,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                    initialDateRange:
                                        Global.selectedDateRange ??
                                            Global.initialDateRange,
                                    firstDate: DateTime.now()
                                        .subtract(Duration(days: 1)),
                                    lastDate: DateTime(DateTime.now().year + 5),
                                  );
                                  if (pickedDate != null) {
                                    print(pickedDate);
                                    String formattedDateStart =
                                        DateFormat('dd MMM yyyy')
                                            .format(pickedDate.start);
                                    String formattedDateEnd =
                                        DateFormat('dd MMM yyyy')
                                            .format(pickedDate.end);

                                    setState(() {
                                      Global.selectedDateRange = pickedDate;
                                      dateStart.text = formattedDateStart;
                                      dateEnd.text = formattedDateEnd;
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 200,
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.calendar_month,
                                      size: 20,
                                      color: Colors.transparent,
                                    ),
                                    title: TextField(
                                      controller: dateEnd,
                                      enabled: true,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        hintText: DateFormat("dd MMM yyyy")
                                            .format(
                                                Global.initialDateRange.end),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DeviceScreenType.desktop ==
                                  screensize.deviceScreenType
                              ? const SizedBox(
                                  width: 15,
                                )
                              : const SizedBox(
                                  height: 15,
                                ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFF5F5F5),
                                borderRadius: BorderRadius.circular(10)),
                            width: 350,
                            child: ListTile(
                              leading: Icon(
                                Icons.account_circle_outlined,
                                color: Color(0xFF222221),
                              ),
                              title: TextField(
                                enabled: true,
                                readOnly: true,
                                onTap: () async {
                                  await showSelectGuestAndRooms(context);
                                  String count1 = Global.RoomData[0].toString();
                                  String count2 = Global.RoomData[1].toString();
                                  String count3 = Global.RoomData[2].toString();
                                  setState(() {
                                    if (count1 == '0' &&
                                        count2 == '0' &&
                                        count3 == '0') {
                                      categoryController.text =
                                          "Select your category";
                                    } else {
                                      categoryController.text =
                                          "${(count1 != '0') ? ("$count1 Rooms") : ""} ${(count2 != '0') ? ("$count2 Adults") : ""} ${(count3 != '0') ? ("$count3 Children") : ""}";
                                    }
                                  });
                                },
                                controller: categoryController,
                                decoration: InputDecoration(
                                    hintText:
                                        "${(count1 != '0') ? ("$count1 Rooms") : ""} ${(count2 != '0') ? ("$count2 Adults") : ""} ${(count3 != '0') ? ("$count3 Children") : ""}",
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          DeviceScreenType.desktop ==
                                  screensize.deviceScreenType
                              ? const SizedBox(
                                  width: 15,
                                )
                              : const SizedBox(
                                  height: 15,
                                ),
                          Container(
                            decoration: BoxDecoration(
                                color: _primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            width: 60,
                            child: TextButton(
                              onPressed: () {
                                if (cityController.text.isNotEmpty) {
                                  Navigator.of(context).pushNamed('/search');
                                } else {
                                  messageBar(
                                      "Error!", "Enter the name of the city");
                                }
                              },
                              child: Container(
                                height: 60,
                                child: const Icon(
                                  Icons.search,
                                  color: Color(0xFF222221),
                                ),
                              ),
                            ),
                          ),
                        ];
                        if (screensize.deviceScreenType ==
                            DeviceScreenType.desktop) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: searchActions),
                          );
                        } else {
                          return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: searchActions);
                        }
                      }),
                      SizedBox(
                        height: _screenSize.height * 0.07,
                      )
                    ],
                  ),
                  _yourKindOfStays(_screenSize),
                  _offersSection(_screenSize),
                  _popularLocations(_screenSize),
                  _pageFooter(_screenSize),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Padding _popularLocations(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Locations",
            // Global.RoomData.toString(),
            style: TextStyle(
              fontFamily: 'Satoshi Variable',
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.357,
              letterSpacing: -0.1850000023841858,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    _popularLocationCard(_screenSize),
                    _popularLocationCard(_screenSize),
                    _popularLocationCard(_screenSize),
                    _popularLocationCard(_screenSize),
                    _popularLocationCard(_screenSize),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  FutureBuilder _popularLocationCard(Size _screenSize) {
    return FutureBuilder(
        future: http.get(Uri.parse('http://localhost:50774/books')),
        builder: ((context, snapshot) {
          // print("hi");
          // if (snapshot.hasData) {
          if (true) {
            // List<dynamic> books = json.decode(snapshot.data.body);
            // List books = json.decode(snapshot.data.body);
            // print(books[0]);
            return Container(
              height: 310,
              width: 300,
              padding: EdgeInsets.fromLTRB(0, 0, _screenSize.width * 0.016, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 275,
                    width: 275,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage("assets/images/1.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  const Text(
                    // books[2]["title"],
                    "Title",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      height: 1.33,
                      letterSpacing: -1.319239854812622,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        }));
  }

  Padding _offersSection(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.only(top: _screenSize.height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Offers",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 1.357,
                letterSpacing: -0.1850000023841858,
              )),
          const Divider(),
          Container(
            // height: _screenSize.height * 0.55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      12,
                      (index) => _offerCard(_screenSize),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => _offerCard(_screenSize),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _offerCard(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, _screenSize.height * 0.02,
          _screenSize.width * 0.02, _screenSize.height * 0.02),
      child: Container(
        padding: EdgeInsets.all(_screenSize.width * 0.01),
        width: 420,
        height: 175,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_screenSize.width * 0.01),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 105,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(_screenSize.width * 0.01),
                          image: const DecorationImage(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1517840901100-8179e982acb7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("10% Instant savings",
                              style: TextStyle(
                                fontFamily: 'Satoshi Variable',
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                height: 1.357,
                                letterSpacing: -0.40799999237060547,
                              )),
                          Container(
                            height: 5,
                            width: 70,
                            color: Colors.orange,
                          ),
                          Container(
                            width: 270,
                            child: const AutoSizeText(
                              "Save more than 10% on booking with Easyatra.Save more than 10% on booking with Easyatra.",
                              style: TextStyle(
                                fontFamily: 'Satoshi Variable',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.375,
                                letterSpacing: -0.40799999237060547,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("T&C's Apply",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.333,
                      letterSpacing: -0.40799999237060547,
                    )),
                TextButton(
                  child: const Text("View Details",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Satoshi Variable',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1.375,
                        letterSpacing: -0.40799999237060547,
                      )),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Stack _pageFooter(Size _screenSize) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset("images/BG1.jpg"),
        Container(
          child: ResponsiveBuilder(
            builder: (context, screensize) {
              var aboutOptions = [
                Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        child: Image.asset('/images/Easyatra.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Easyatra provides good deals on'),
                          addVerticalSpace(10),
                          const Text('hotel booking and provides you'),
                          addVerticalSpace(10),
                          const Text('great and awesome offers.'),
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: _screenSize.width * 0.11,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _screenSize.width * 0.01,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("/images/1.png"),
                                  ),
                                ),
                              ),
                              Image.asset('/images/2.png'),
                              addHorizontalySpace(10),
                              Image.asset('/images/3.png'),
                              addHorizontalySpace(10),
                              Image.asset('/images/4.png'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 100,
                  child: Image.asset("images/playstore.png"),
                ),
                Container(
                  height: 40,
                  width: 100,
                  child: Image.asset("images/appstore.png"),
                ),
                Container(
                  height: 180,
                  padding: EdgeInsets.fromLTRB(0, _screenSize.height * 0.015, 0,
                      _screenSize.height * 0.015),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Help',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text('Customer Support'),
                      const Text('Booking Details'),
                      const Text('Terms & Conditions'),
                      const Text('Privacy Policy'),
                    ],
                  ),
                ),
              ];
              if (screensize.deviceScreenType == DeviceScreenType.desktop) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                      _screenSize.width * 0.1,
                      _screenSize.width * 0.02,
                      _screenSize.width * 0.1,
                      _screenSize.width * 0.02),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: aboutOptions),
                );
              } else {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: aboutOptions);
              }
            },
          ),
        ),
      ],
    );
  }

  Container _yourKindOfStays(Size _screenSize) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Your Kind of Stays",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                fontSize: 28,
                fontWeight: FontWeight.w700,
                height: 1.357,
                letterSpacing: -0.1850000023841858,
              )),
          const SizedBox(
            height: 0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/price');
              }, title: "Price Page"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/detail');
              }, title: "Detail Page"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/yourkindofstay');
              }, title: "Your Stay"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/about');
              }, title: "About"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/utility');
              }, title: "utility"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/bookingstrips');
              }, title: "Booking and Trips"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/login');
              }, title: "Login"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/signup');
              }, title: "Sign Up"),
              _kindOfStayCard(_screenSize, onClick: () {
                Navigator.of(context).pushNamed('/contactus');
              }, title: "Contact Us"),
            ]),
          ),
          SizedBox(
            height: _screenSize.height * 0.025,
          )
        ],
      ),
    );
  }

  Container _kindOfStayCard(Size _screenSize,
      {void Function()? onClick, String? title}) {
    return Container(
        height: 200,
        width: 270,
        padding: EdgeInsets.fromLTRB(0, 0, _screenSize.width * 0.016, 0),
        child: InkWell(
          onTap: onClick,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: 250,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(_screenSize.width * 0.02),
                ),
              ),
              Text(
                title ?? "Hotel",
                style: const TextStyle(
                  fontFamily: 'Satoshi Variable',
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  height: 1.33,
                  letterSpacing: -1.319239854812622,
                ),
              ),
            ],
          ),
        ));
  }

  Column _mainBanner(Size _screenSize) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: _screenSize.width * 0.95,
              height: _screenSize.height * 0.4,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(_screenSize.width * 0.02),
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1581609836630-9007630f7a7b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80"),
                      fit: BoxFit.cover)),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("All you need is Easyatra",
                      style: TextStyle(
                        color: const Color(0xFFFFE297),
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.width * 0.02,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                        letterSpacing: -1.319239854812622,
                      )),
                  Text("Find Awesome Stays",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.width * 0.05,
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                        letterSpacing: -1.319239854812622,
                      ))
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.1,
        )
      ],
    );
  }

  Column _titleBar(Size _screenSize) {
    ButtonStyle mainActionButtonsStyle = ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Set the border radius here
          ),
        ),
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered))
            return const Color(0xFF3D99EE);
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) return Colors.white;
          return const Color(0xFF5E5E5E);
        }));
    TextStyle txtStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        ResponsiveBuilder(builder: (context, sizingInformation) {
          var loginActions = [
            TextButton(
                onPressed: () {
                  showPlatformDialog(
                      context: context, builder: (_) => const HostProperty());
                },
                style: mainActionButtonsStyle,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(6, 9, 6, 9),
                  child: Text('Host your property', style: txtStyle),
                )),
            Visibility(
              visible: !Global.loggedin,
              child: TextButton(
                onPressed: () {
                  showPlatformDialog(
                      context: context, builder: (_) => const Login());
                },
                style: mainActionButtonsStyle,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(6, 9, 6, 9),
                  child: Text('Log In', style: txtStyle),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                !Global.loggedin
                    ? showPlatformDialog(
                        context: context, builder: (_) => const SignUp())
                    : AuthController.instance.logout();
              },
              style: mainActionButtonsStyle,
              child: Container(
                padding: const EdgeInsets.fromLTRB(6, 9, 6, 9),
                child: Text(!Global.loggedin ? 'Sign Up' : 'Logout',
                    style: txtStyle),
              ),
            ),
          ];
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: Image.asset('/images/Easyatra.png'),
                ),
                Container(
                  width: 400,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: loginActions),
                )
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: Image.asset('/images/Easyatra.png'),
                ),
                Container(
                  width: _screenSize.width * 0.3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: loginActions),
                )
              ],
            );
          }
        }),
        SizedBox(
          height: _screenSize.height * 0.03,
        )
      ],
    );
  }
}

Future<dynamic> showSelectGuestAndRooms(BuildContext context) {
  int count1 = Global.RoomData[0];
  int count2 = Global.RoomData[1];
  int count3 = Global.RoomData[2];
  return showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
          title: const Text("Select rooms and guests"),
          content: Container(
            height: 250,
            width: 400,
            child: Column(
              children: [
                const Divider(
                  thickness: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Rooms'),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (count1 > 1) {
                                  count1--;
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.remove_circle_outline)),
                          Text(count1.toString()),
                          IconButton(
                              onPressed: () {
                                count1++;
                                setState(() {});
                              },
                              icon: const Icon(Icons.add_circle_outline)),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Adults'),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (count2 > 1) {
                                  count2--;
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.remove_circle_outline)),
                          Text(count2.toString()),
                          IconButton(
                              onPressed: () {
                                count2++;
                                setState(() {});
                              },
                              icon: const Icon(Icons.add_circle_outline)),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Children'),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (count3 > 1) {
                                  count3--;
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.remove_circle_outline)),
                          Text(count3.toString()),
                          IconButton(
                              onPressed: () {
                                count3++;
                                setState(() {});
                              },
                              icon: const Icon(Icons.add_circle_outline)),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    if (count1 != 0) {
                      Global.RoomData = [count1, count2, count3];
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Number of rooms cannot be zero.'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.99,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                        gradient: blueGradient(),
                        borderRadius: BorderRadius.circular(30)),
                    // padding: const EdgeInsets.fromLTRB(30, 13, 30, 10),
                    child: const Center(
                      child: Text(
                        'Apply',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ));
    }),
  );
}
