// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_hotel_management_webapp/globals/global.dart';
import 'package:flutter_hotel_management_webapp/model/hotel.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../provider/page_rebuilder.dart';
import '../utilityWidgets/commonWidgets.dart';
import 'package:flutter_hotel_management_webapp/pages/hotelsearchpage.dart';

class YourKindOfStay extends StatefulWidget {
  const YourKindOfStay({super.key});

  @override
  State<YourKindOfStay> createState() => _YourKindOfStayState();
}

class _YourKindOfStayState extends State<YourKindOfStay> {
  final List<Hotel> _hotelsList = [
    Hotel(
      id: 1,
      name: "Grand Hotel",
      place: "New York",
      rating: 4.5,
      popularamenities: "Swimming pool, Gym, Spa",
      hotelimages: "hotel_image.jpg",
      availableroomtype: ["Single", "Double", "Suite"],
      description: Global.hotelDesc,
      cancellationpolicy: "Free cancellation up to 24 hours before check-in.",
      rulesandregulations: "No smoking, No pets allowed.",
      reviews: [
        {
          "user": "John",
          "rating": 4.8,
          "comment": "Great hotel with excellent service."
        },
        {
          "user": "Sarah",
          "rating": 4.2,
          "comment": "Comfortable rooms and friendly staff."
        }
      ],
      cost: 3234,
    )
  ];
  final List<Hotel> _trendinghotelsList = [
    Hotel(
      id: 1,
      name: "Grand Hotel",
      place: "New York",
      rating: 4.5,
      popularamenities: "Swimming pool, Gym, Spa",
      hotelimages: "hotel_image.jpg",
      availableroomtype: ["Single", "Double", "Suite"],
      description: Global.hotelDesc,
      cancellationpolicy: "Free cancellation up to 24 hours before check-in.",
      rulesandregulations: "No smoking, No pets allowed.",
      reviews: [
        {
          "user": "John",
          "rating": 4.8,
          "comment": "Great hotel with excellent service."
        },
        {
          "user": "Sarah",
          "rating": 4.2,
          "comment": "Comfortable rooms and friendly staff."
        }
      ],
      cost: 4562,
    )
  ];
  final Color _primaryColor = Color(0xFFE1F3FF);

  TextEditingController cityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  @override
  void initState() {
    cityController.text = Global.city;
    dateStart.text = DateFormat("dd MMM yyyy")
        .format((Global.selectedDateRange ?? Global.initialDateRange).start);
    dateEnd.text = DateFormat("dd MMM yyyy")
        .format((Global.selectedDateRange ?? Global.initialDateRange).end);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageRebuilder = Provider.of<PageRebuilder>(context);
    String count1 = Global.RoomData[0].toString();
    String count2 = Global.RoomData[1].toString();
    String count3 = Global.RoomData[2].toString();
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                _screenSize.width * 0.05, 20, _screenSize.width * 0.05, 10),
            child: _titleBar(_screenSize),
          ),
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
                  DeviceScreenType.desktop == screensize.deviceScreenType
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
                            colorScheme: ColorScheme.fromSwatch().copyWith(
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
                                      borderRadius: BorderRadius.circular(15),
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
                            initialDateRange: Global.selectedDateRange ??
                                Global.initialDateRange,
                            firstDate:
                                DateTime.now().subtract(Duration(days: 1)),
                            lastDate: DateTime(DateTime.now().year + 5),
                          );
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDateStart =
                                DateFormat('dd MMM yyyy')
                                    .format(pickedDate.start);
                            String formattedDateEnd = DateFormat('dd MMM yyyy')
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
                                      .format(Global.initialDateRange.start),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ),
                      DeviceScreenType.desktop == screensize.deviceScreenType
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
                            colorScheme: ColorScheme.fromSwatch().copyWith(
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
                                      borderRadius: BorderRadius.circular(15),
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
                            initialDateRange: Global.selectedDateRange ??
                                Global.initialDateRange,
                            firstDate:
                                DateTime.now().subtract(Duration(days: 1)),
                            lastDate: DateTime(DateTime.now().year + 5),
                          );
                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDateStart =
                                DateFormat('dd MMM yyyy')
                                    .format(pickedDate.start);
                            String formattedDateEnd = DateFormat('dd MMM yyyy')
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
                                    .format(Global.initialDateRange.end),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  DeviceScreenType.desktop == screensize.deviceScreenType
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
                          await showSelectGuestAndRooms(context, pageRebuilder);
                          String count1 = Global.RoomData[0].toString();
                          String count2 = Global.RoomData[1].toString();
                          String count3 = Global.RoomData[2].toString();
                          setState(() {
                            if (count1 == '0' &&
                                count2 == '0' &&
                                count3 == '0') {
                              categoryController.text = "Select your category";
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
                  DeviceScreenType.desktop == screensize.deviceScreenType
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
                          messageBar("Error!", "Enter the name of the city");
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
                if (screensize.deviceScreenType == DeviceScreenType.desktop) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          _listHeading(_screenSize),
          _lastMinuteHotels(_screenSize),
          _trendingHotels(_screenSize),
          _moreAccomodations(_screenSize),
          _pageFooter(_screenSize),
        ],
      )),
    );
  }

  Padding _pageFooter(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          _screenSize.width * 0.05, 20, _screenSize.width * 0.05, 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("images/BG1.jpg"),
          Container(
            width: _screenSize.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180,
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
                          Text(
                            'Easyatra provides good deals on',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: _screenSize.width * 0.01,
                              fontWeight: FontWeight.w400,
                              height: 1.3, // equivalent to line-height in CSS
                              letterSpacing:
                                  0, // equivalent to letter-spacing in CSS
                            ),
                          ),
                          Text(
                            'hotel booking and provides you',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: _screenSize.width * 0.01,
                              fontWeight: FontWeight.w400,
                              height: 1.3, // equivalent to line-height in CSS
                              letterSpacing:
                                  0, // equivalent to letter-spacing in CSS
                            ),
                          ),
                          Text(
                            'great and awesome offers.',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontSize: _screenSize.width * 0.01,
                              fontWeight: FontWeight.w400,
                              height: 1.3, // equivalent to line-height in CSS
                              letterSpacing:
                                  0, // equivalent to letter-spacing in CSS
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.02,
                      ),
                      Container(
                        width: _screenSize.width * 0.11,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('/images/1.png'),
                            Image.asset('/images/2.png'),
                            Image.asset('/images/3.png'),
                            Image.asset('/images/4.png'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: _screenSize.height * 0.3,
                  width: _screenSize.width * 0.1,
                  child: Image.asset("images/playstore.png"),
                ),
                Container(
                  height: _screenSize.height * 0.3,
                  width: _screenSize.width * 0.1,
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
                      Text(
                        'Help',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Customer Support',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: _screenSize.width * 0.01,
                          fontWeight: FontWeight.w400,
                          height: 1.3, // equivalent to line-height in CSS
                          letterSpacing:
                              0, // equivalent to letter-spacing in CSS
                        ),
                      ),
                      Text(
                        'Booking Details',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: _screenSize.width * 0.01,
                          fontWeight: FontWeight.w400,
                          height: 1.3, // equivalent to line-height in CSS
                          letterSpacing:
                              0, // equivalent to letter-spacing in CSS
                        ),
                      ),
                      Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: _screenSize.width * 0.01,
                          fontWeight: FontWeight.w400,
                          height: 1.3, // equivalent to line-height in CSS
                          letterSpacing:
                              0, // equivalent to letter-spacing in CSS
                        ),
                      ),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontFamily: 'Poppins',
                          fontSize: _screenSize.width * 0.01,
                          fontWeight: FontWeight.w400,
                          height: 1.3, // equivalent to line-height in CSS
                          letterSpacing:
                              0, // equivalent to letter-spacing in CSS
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _moreAccomodations(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          _screenSize.width * 0.05, 20, _screenSize.width * 0.05, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Locations",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.02,
                fontWeight: FontWeight.w700,
                height: 1.357,
                letterSpacing: -0.1850000023841858,
              )),
          SizedBox(
            height: _screenSize.height * 0.03,
          ),
          Container(
            height: _screenSize.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    _moreAccomodationCard(_screenSize),
                    _moreAccomodationCard(_screenSize),
                    _moreAccomodationCard(_screenSize),
                    _moreAccomodationCard(_screenSize),
                    _moreAccomodationCard(_screenSize),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _moreAccomodationCard(Size _screenSize) {
    return Container(
      height: _screenSize.height * 0.48,
      width: _screenSize.width * 0.25,
      padding: EdgeInsets.fromLTRB(0, 0, _screenSize.width * 0.016, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: _screenSize.height * 0.43,
            width: (_screenSize.width * 0.945) / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(_screenSize.width * 0.02),
            ),
          ),
          Text(
            "Hotels",
            style: TextStyle(
              fontFamily: 'Satoshi Variable',
              fontSize: _screenSize.width * 0.016,
              fontWeight: FontWeight.w500,
              height: 1.33,
              letterSpacing: -1.319239854812622,
            ),
          ),
        ],
      ),
    );
  }

  Column _trendingHotels(Size _screenSize) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(_screenSize.width * 0.05, 20, 0, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trending Hotel Desitinations",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      height: 57 / 42,
                      letterSpacing: -0.9034286141395569,
                    ),
                  ),
                  Text(
                    "Get best deals on hotels",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 30 / 22,
                      letterSpacing: -0.9034286141395569,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _screenSize.height * 0.02,
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: 13,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 330,
                      margin: EdgeInsets.only(right: 25),
                      width: _screenSize.width * 0.267,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"),
                                    fit: BoxFit.cover)),
                            height: 300,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Lucknow",
                            style: TextStyle(
                              fontFamily: 'Satoshi Variable',
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              height: 49 /
                                  36, // Calculate line height by dividing line-height by font-size
                              letterSpacing: -0.40799999237060547,
                            ),
                          ),
                          Text(
                            "More than 143+ Booked hotels us with in Delhi",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Padding _lastMinuteHotelCard(Size _screenSize, Hotel hotel) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, _screenSize.height * 0.02,
          _screenSize.width * 0.01, _screenSize.width * 0.03),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_screenSize.width * 0.01),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
            border: Border.all(color: Colors.black, width: 0.2)),
        height: 250,
        width: _screenSize.width * 0.43,
        child: Row(
          children: [
            Container(
              width: _screenSize.width * 0.2,
              // height: _screenSize.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: _screenSize.width * 0.22,
                  child: Padding(
                    padding: EdgeInsets.all(_screenSize.width * 0.01),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: _screenSize.height * 0.35,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    hotel.name,
                                    style: TextStyle(
                                      fontFamily: 'Satoshi Variable',
                                      fontSize: _screenSize.width * 0.018,
                                      fontWeight: FontWeight.w600,
                                      height: 1.357,
                                      letterSpacing: -0.40799999237060547,
                                    ),
                                  ),
                                  Text(hotel.place,
                                      style: TextStyle(
                                        fontFamily: 'Satoshi Variable',
                                        fontSize: _screenSize.width * 0.012,
                                        fontWeight: FontWeight.w500,
                                        height: 1.333,
                                        letterSpacing: -0.40799999237060547,
                                      ))
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFDA4167),
                                ),
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Text((hotel.rating.toString()) + "/5",
                                    style: TextStyle(
                                        fontFamily: 'Satoshi Variable',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        height: 24 /
                                            18, // Line height calculated by dividing line height by font size
                                        letterSpacing: -0.903,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                        _priceDetails(_screenSize),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _priceDetails(Size _screenSize) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Starting from',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,

                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.012,
                fontWeight: FontWeight.w700,
                height: 32 /
                    24, // Line height calculated by dividing line height by font size
                letterSpacing: -0.408,
              )),
          Text('₹ 4,433',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.012,
                fontWeight: FontWeight.w500,
                height: 32 /
                    24, // Line height calculated by dividing line height by font size
                letterSpacing: -0.802,
              )),
          Text('₹ 3,493',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.02,
                fontWeight: FontWeight.w700,
                height: 48 /
                    35, // Line height calculated by dividing line height by font size
                letterSpacing: -0.802,
              )),
          Text(
            '+ ₹ 594 taxes and fee',
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Satoshi Variable',
              fontSize: _screenSize.width * 0.01,
              fontWeight: FontWeight.w500,
              height: 27 /
                  20, // Line height calculated by dividing line height by font size
              letterSpacing: -0.802,
            ),
          ),
          Text("Per night",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.01,
                fontWeight: FontWeight.w500,
                height: 27 /
                    20, // Line height calculated by dividing line height by font size
                letterSpacing: -0.802,
              )),
        ],
      ),
    );
  }

  Container _lastMinuteHotels(Size _screenSize) {
    return Container(
        height: 370,
        padding: EdgeInsets.fromLTRB(
            _screenSize.width * 0.05, 10, _screenSize.width * 0.05, 10),
        child: ListView.builder(
          itemCount: 9,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return _lastMinuteHotelCard(Size(900, 750), _hotelsList[0]);
          },
        ));
  }

  Column _listHeading(Size _screenSize) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
              _screenSize.width * 0.05, 20, _screenSize.width * 0.05, 10),
          child: Column(children: [
            Container(
              height: _screenSize.height * 0.15,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Home",
                            style: TextStyle(
                              fontFamily: 'Satoshi Variable',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 35 / 26,
                              letterSpacing: -0.40799999237060547,
                            )),
                        SizedBox(
                          width: _screenSize.width * 0.005,
                        ),
                        Text(">",
                            style: TextStyle(
                              fontFamily: 'Satoshi Variable',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 35 / 26,
                              letterSpacing: -0.40799999237060547,
                            )),
                        SizedBox(
                          width: _screenSize.width * 0.005,
                        ),
                        Text("Delhi",
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'Satoshi Variable',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 35 / 26,
                              letterSpacing: -0.40799999237060547,
                            )),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last minute hotel near you",
                          style: TextStyle(
                            fontFamily: 'Satoshi Variable',
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            height: 57 / 42,
                            letterSpacing: -0.9034286141395569,
                          ),
                        ),
                        Text(
                          "Find deals for hotels tonight or upcoming dates",
                          style: TextStyle(
                            fontFamily: 'Satoshi Variable',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 30 / 22,
                            letterSpacing: -0.9034286141395569,
                          ),
                        ),
                      ],
                    ),
                  ]),
            )
          ]),
        ),
        SizedBox(
          height: _screenSize.height * 0.0,
        )
      ],
    );
  }

  Column _searchBanner(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Color(0xFFF8FAFC),
          height: _screenSize.height * 0.27,
          padding: EdgeInsets.fromLTRB(_screenSize.width * 0.05,
              _screenSize.height * 0.04, _screenSize.width * 0.05, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find perfect Hotels near you',
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    height: 76 / 56,
                    letterSpacing: -0.1850000023841858,
                  ),
                ),
                _searchFunctions(_screenSize),
              ]),
        ),
      ],
    );
  }

  Column _titleBar(Size _screenSize) {
    TextStyle txtStyle = TextStyle(
      fontSize: _screenSize.width * 0.013,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 50,
              child: Image.asset('/images/Easyatra.png'),
            ),
            Container(
              width: _screenSize.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                      child: Text('Host your property', style: txtStyle),
                    ),
                    style: ButtonStyle(foregroundColor:
                        MaterialStateColor.resolveWith((states) {
                      return Colors.blue;
                    })),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.account_circle_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.03,
        )
      ],
    );
  }

  Column _searchFunctions(Size _screenSize) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10)),
              width: _screenSize.width * 0.27,
              child: ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  color: Color(0xFF222221),
                ),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter a city or hotel',
                      border: InputBorder.none),
                ),
              ),
            ),
            // SizedBox(width: _screenSize.width*0.007,),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  width: _screenSize.width * 0.15,
                  child: ListTile(
                    leading: Icon(
                      Icons.calendar_month,
                      size: 20,
                      color: Color(0xFF222221),
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: 'Thu 16 Nov', border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  width: _screenSize.width * 0.15,
                  child: ListTile(
                    leading: Icon(
                      Icons.calendar_month,
                      size: 20,
                      color: Colors.transparent,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: 'Fri 17 Nov', border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(width: _screenSize.width*0.007,),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10)),
              width: _screenSize.width * 0.27,
              child: ListTile(
                leading: Icon(
                  Icons.account_circle_outlined,
                  color: Color(0xFF222221),
                ),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: '1 room, 2 guests', border: InputBorder.none),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: _primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              width: _screenSize.width * 0.04,
              child: TextButton(
                onPressed: () {},
                child: Container(
                  height: 60,
                  child: Icon(
                    Icons.search,
                    color: Color(0xFF222221),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.04,
        )
      ],
    );
  }
}
