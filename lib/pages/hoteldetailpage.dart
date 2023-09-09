// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_management_webapp/model/hotel.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hotel_management_webapp/utilityWidgets/review_and_book.dart';
import 'package:flutter_hotel_management_webapp/utils/constant.dart';
import 'package:flutter_hotel_management_webapp/utils/expandable_text.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../globals/global.dart';
import '../utils/app_text.dart';
import '../utils/styles.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({super.key});

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  void _fetchHotels() async {
    final response = await http.get(Uri.parse("http://localhost:3000/hotels"));
    final List<dynamic> data = jsonDecode(response.body);

    final List<Hotel> hotels =
        data.map((item) => Hotel.fromJson(item)).toList();
    hotelNotifier.value = hotels;
  }

  ValueNotifier<List<Hotel>> hotelNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    // _fetchHotels();
    // _fetchHotels();
    Hotel hotel = Hotel(
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
    );
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            _screenSize.width * 0.01, 20, _screenSize.width * 0.01, 20),
        child: Column(children: [
          _titleBar(_screenSize),
          _popularImages(_screenSize),
          _hotelDetailsSection(_screenSize, hotel),
          _roomCardScroller(_screenSize),
          _hotelDescription(_screenSize, hotel),
          _contentPolicy(_screenSize),
          _rules(_screenSize),
          Divider(color: Colors.grey.withOpacity(0.6)),
          _ratingSection(_screenSize),
          Divider(color: Colors.grey.withOpacity(0.6)),
          _reviewSection(_screenSize),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Similar Hotels",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontFamily: 'Satoshi Variable',
                  fontSize: _screenSize.height * 0.05,
                  fontWeight: FontWeight.w700,
                  height: 57 / 42, // line-height / font-size
                  letterSpacing: -0.9034286141395569,
                ),
              ),
              SizedBox(
                height: _screenSize.height * 0.015,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(6, (index) {
                  return itemCard(
                    context,
                    4433,
                    3500,
                    4.7,
                    'images/1.jpg',
                    "Hotel Sunshine Inn",
                    'Near Prem Nagar',
                    'Loreium Ipsumsjdbvvv sd sbv fvbmfvmfsdfweneufmgo',
                    _screenSize,
                  );
                })),
              ),
            ],
          ),
          _pageFooter(_screenSize),
        ]),
      ),
    );
  }

  Padding _ratingSection(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.only(
        top: _screenSize.width * 0.015,
        bottom: _screenSize.width * 0.015,
      ),
      child: Container(
        width: _screenSize.width * 0.94,
        padding: EdgeInsets.all(_screenSize.width * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: _screenSize.width * 0.45,
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Reviews",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontFamily: 'Satoshi Variable',
                      fontSize: _screenSize.height * 0.03,
                      fontWeight: FontWeight.w700,
                      height: 57 / 42, // line-height / font-size
                      letterSpacing: -0.9034286141395569,
                    ),
                  ),
                  addVerticalSpace(20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: _screenSize.width * 0.30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(3.5),
                                    child: LinearProgressIndicator(
                                      value: 0.5,
                                      minHeight: 7,
                                      backgroundColor: Colors.grey[300],
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                                addHorizontalySpace(15),
                                Text(
                                  "${index + 1}",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontFamily: 'Satoshi Variable',
                                    fontSize: _screenSize.height * 0.025,
                                    fontWeight: FontWeight.bold,
                                    height: 57 / 42, // line-height / font-size
                                    letterSpacing: -0.9034286141395569,
                                  ),
                                ),
                                addHorizontalySpace(15),
                                Icon(
                                  Icons.star,
                                  size: _screenSize.height * 0.025,
                                  color: Colors.amber,
                                )
                              ],
                            ),
                            addVerticalSpace(10),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              width: _screenSize.width * 0.45,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Overall Rating",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.height * 0.035,
                        fontWeight: FontWeight.w700,
                        height: 57 / 42, // line-height / font-size
                        letterSpacing: -0.9034286141395569,
                      ),
                    ),
                    addVerticalSpace(18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  double size = _screenSize.height / 30;
                                  double stars = 4.7;
                                  int wholeRating = stars.floor();
                                  int fractRating =
                                      ((stars - wholeRating) * 10).ceil();
                                  if (index < wholeRating) {
                                    return Icon(Icons.star,
                                        color: Colors.amber, size: size);
                                  } else if (index == wholeRating) {
                                    return SizedBox(
                                      height: size,
                                      width: size,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: size,
                                          ),
                                          ClipRect(
                                              clipper:
                                                  Clipper(part: fractRating),
                                              child: Icon(Icons.star,
                                                  color: grey, size: size))
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Icon(Icons.star,
                                        color: grey, size: size);
                                  }
                                },
                              ),
                            ),
                            addHorizontalySpace(3),
                          ],
                        ),
                        addVerticalSpace(15),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFFDA4167),
                          ),
                          padding: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                          child: Text(
                            "4.5" + "/5",
                            style: TextStyle(
                              fontFamily: 'Satoshi Variable',
                              fontSize: _screenSize.height * 0.025,
                              fontWeight: FontWeight.bold,
                              height: 57 / 42,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Padding _similarHotelCard(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, _screenSize.height * 0.02,
          _screenSize.width * 0.02, _screenSize.width * 0.05),
      child: Container(
        padding: EdgeInsets.all(_screenSize.width * 0.01),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 5.42905855178833),
                blurRadius: 19.001707077026367,
                spreadRadius: -1.809686303138733,
                color: Color(0x18274B1F),
              ),
              BoxShadow(
                offset: Offset(0, 3.619372606277466),
                blurRadius: 8.143588066101074,
                spreadRadius: -2.714529275894165,
                color: Color(0x18274B1F),
              )
            ],
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(_screenSize.width * 0.01)),
        width: _screenSize.width * 0.295,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                    height: _screenSize.height * 0.4,
                    width: _screenSize.width * 0.28,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(_screenSize.width * 0.01),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                          ),
                          fit: BoxFit.cover,
                        ))),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFDA4167),
                  ),
                  padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Text("4.5" + "/5",
                      style: TextStyle(
                          fontFamily: 'Satoshi Variable',
                          fontSize: _screenSize.width * 0.01,
                          fontWeight: FontWeight.w700,
                          height: 24 /
                              18, // Line height calculated by dividing line height by font size
                          letterSpacing: -0.903,
                          color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: _screenSize.height * 0.02),
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Luxe Double Room",
                              style: TextStyle(
                                fontSize: _screenSize.width * 0.016,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontFamily: 'Satoshi Variable',

                                fontWeight: FontWeight.w700,
                                height: 43 / 32, // line-height / font-size
                                letterSpacing: -0.9034286141395569,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "For 2 Adults",
                                  style: TextStyle(
                                    fontFamily: 'Satoshi Variable',
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontSize: _screenSize.width * 0.011,
                                    fontWeight: FontWeight.w400,
                                    height: 35 / 26, // line-height / font-size
                                    letterSpacing: -0.8015938997268677,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: _screenSize.height * 0.03),
                        Container(
                          width: _screenSize.width * 0.18,
                          child: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elitLorem ipsum dolor sit amet, ",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontFamily: 'Satoshi Variable',
                              fontSize: _screenSize.width * 0.01,
                              fontWeight: FontWeight.w500,
                              height: 1.3,
                              letterSpacing: -0.9128715395927429,
                            ),
                          ),
                        ),
                      ]),
                  Column(
                    children: [
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              double size = _screenSize.height / 30;
                              double stars = 4.7;
                              int wholeRating = stars.floor();
                              int fractRating =
                                  ((stars - wholeRating) * 10).ceil();
                              if (index < wholeRating) {
                                return Icon(Icons.star,
                                    color: Colors.amber, size: size);
                              } else if (index == wholeRating) {
                                return SizedBox(
                                  height: size,
                                  width: size,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: size,
                                      ),
                                      ClipRect(
                                          clipper: Clipper(part: fractRating),
                                          child: Icon(Icons.star,
                                              color: grey, size: size))
                                    ],
                                  ),
                                );
                              } else {
                                return Icon(Icons.star,
                                    color: grey, size: size);
                              }
                            }),
                          ),
                        ],
                      ),
                      _priceDetails(_screenSize),
                    ],
                  ),
                ]),
          ],
        ),
      ),
    );
  }

  Column _reviewSection(Size _screenSize) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(
              height: _screenSize.height * 0.07,
            ),
            Container(
              width: _screenSize.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _reviewCard(_screenSize, 0.595),
                  _reviewCard(_screenSize, 0.295),
                ],
              ),
            ),
            SizedBox(height: _screenSize.height * 0.04),
            Container(
              width: _screenSize.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _reviewCard(_screenSize, 0.295),
                  _reviewCard(_screenSize, 0.595),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(_screenSize.width * 0.015,
                    _screenSize.width * 0.015, 0, _screenSize.width * 0.015),
                width: _screenSize.width * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue;
                        else
                          return Colors.white;
                      }), foregroundColor:
                          MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.white;
                        else
                          return Colors.blue;
                      })),
                      child: Container(
                        padding: EdgeInsets.all(_screenSize.width * 0.01),
                        child: Row(
                          children: [
                            const Icon(Icons.edit),
                            Text(
                              "Write Your Review",
                              style: TextStyle(
                                  fontSize: _screenSize.width * 0.013,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ))
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.01,
        )
      ],
    );
  }

  Stack _pageFooter(Size _screenSize) {
    return Stack(
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
                    const Text(
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
                        letterSpacing: 0, // equivalent to letter-spacing in CSS
                      ),
                    ),
                    Text(
                      'Booking Details',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        // fontFamily: 'Poppins',
                        fontSize: _screenSize.width * 0.01,
                        fontWeight: FontWeight.w400,
                        height: 1.3, // equivalent to line-height in CSS
                        letterSpacing: 0, // equivalent to letter-spacing in CSS
                      ),
                    ),
                    Text(
                      'Terms & Conditions',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        // fontFamily: 'Poppins',
                        fontSize: _screenSize.width * 0.01,
                        fontWeight: FontWeight.w400,
                        height: 1.3, // equivalent to line-height in CSS
                        letterSpacing: 0, // equivalent to letter-spacing in CSS
                      ),
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        // fontFamily: 'Poppins',
                        fontSize: _screenSize.width * 0.01,
                        fontWeight: FontWeight.w400,
                        height: 1.3, // equivalent to line-height in CSS
                        letterSpacing: 0, // equivalent to letter-spacing in CSS
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container _reviewCard(Size _screenSize, double fraction) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 28,
              offset: const Offset(2, 4), // changes the position of the shadow
            ),
          ]),
      padding: EdgeInsets.all(_screenSize.width * 0.02),
      width: _screenSize.width * fraction,
      height: _screenSize.width * 0.38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: _screenSize.height * 0.01,
                    ),
                    child: CircleAvatar(
                      radius: _screenSize.width * 0.023,
                      backgroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: _screenSize.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Samantha Payne",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontFamily: 'Manrope',
                        fontSize: _screenSize.width * 0.018,
                        fontWeight: FontWeight.w600,
                        height: 41 /
                            30, // Calculate line height by dividing line height by font size
                        letterSpacing: 0,
                      )),
                  Text(
                    "@Sam.Payne90",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontFamily: 'Manrope',
                      fontSize: _screenSize.width * 0.012,
                      fontWeight: FontWeight.w400,
                      height: 29 /
                          26, // Calculate line height by dividing line height by font size
                      letterSpacing: 0,
                    ),
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          double size = _screenSize.height / 30;
                          double stars = 3.5;
                          int wholeRating = stars.floor();
                          int fractRating = ((stars - wholeRating) * 10).ceil();
                          if (index < wholeRating) {
                            return Icon(Icons.star,
                                color: Colors.amber, size: size);
                          } else if (index == wholeRating) {
                            return SizedBox(
                              height: size,
                              width: size,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: size,
                                  ),
                                  ClipRect(
                                    clipper: Clipper(part: fractRating),
                                    child: Icon(
                                      Icons.star,
                                      color: grey,
                                      size: size,
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Icon(Icons.star, color: grey, size: size);
                          }
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: _screenSize.height * 0.03,
              ),
            ],
          ),
          SizedBox(
            height: _screenSize.height * 0.03,
          ),
          Container(
            padding: EdgeInsets.all(_screenSize.width * 0.005),
            decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(10)),
            width: _screenSize.width * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.check,
                  color: const Color(0xFF064E3B),
                  size: _screenSize.width * 0.013,
                ),
                Text(
                  "Verified Purchase",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: const Color(0xFF064E3B),
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.012,
                    fontWeight: FontWeight.w500,
                    height: 46 / 34, // line-height / font-size
                    letterSpacing: -0.9034286141395569,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _screenSize.height * 0.01,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim praesent elementum facilisis leo, vel",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              // fontFamily: 'Satoshi Variable',

              fontWeight: FontWeight.w400,
              height: 43 /
                  32, // Calculate line height by dividing line height by font size
              // letterSpacing: -1.5149507522583008,
              fontSize: _screenSize.width * 0.015,
            ),
          ),
          SizedBox(
            height: _screenSize.height * 0.02,
          ),
          Text(
            "23 Nov 2021",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'Manrope',
              fontSize: _screenSize.width * 0.012,
              fontWeight: FontWeight.w400,
              height: 1.2, // equivalent to line-height in CSS
              letterSpacing: 0, // equivalent to letter-spacing in CSS
            ),
          ),
        ],
      ),
    );
  }

  Column _rules(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rules and Regulations",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'Satoshi Variable',
            fontSize: _screenSize.height * 0.05,
            fontWeight: FontWeight.w700,
            height: 57 / 42, // line-height / font-size
            letterSpacing: -0.9034286141395569,
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.02,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            // fontFamily: 'Satoshi Variable',

            fontWeight: FontWeight.w400,
            height: 43 /
                32, // Calculate line height by dividing line height by font size
            // letterSpacing: -1.5149507522583008,
            fontSize: _screenSize.width * 0.015,
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.03,
        ),
      ],
    );
  }

  Column _hotelDescription(Size _screenSize, Hotel hotel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hotel Description",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'Satoshi Variable',
            fontSize: _screenSize.height * 0.05,
            fontWeight: FontWeight.w700,
            height: 57 / 42, // line-height / font-size
            letterSpacing: -0.9034286141395569,
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.02,
        ),
        Material(
          child: ExpandableText(
            text: hotel.description,
            textHeight: _screenSize.width * 03,
            size: _screenSize.width * 0.015,
            color: black,
            // style: TextStyle(
            // decoration: TextDecoration.none,
            // color: Colors.black,
            // fontFamily: 'Satoshi Variable',
            // fontSize: _screenSize.width * 0.015,
            // fontWeight: FontWeight.w700,
            // height: 43.2 / 32, // line-height / font-size
            // letterSpacing: -0.9,
            // ),
          ),
        ),
        // Text(Global.hotelDesc),
        const Divider(
          color: Colors.black,
        ),
        SizedBox(
          height: _screenSize.height * 0.06,
        ),
      ],
    );
  }

  Column _contentPolicy(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Cancellation Policy",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'Satoshi Variable',
            fontSize: _screenSize.height * 0.05,
            fontWeight: FontWeight.w700,
            height: 57 / 42, // line-height / font-size
            letterSpacing: -0.9034286141395569,
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.02,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.",
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            // fontFamily: 'Satoshi Variable',

            fontWeight: FontWeight.w400,
            height: 43 /
                32, // Calculate line height by dividing line height by font size
            // letterSpacing: -1.5149507522583008,
            fontSize: _screenSize.width * 0.015,
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.03,
        ),
      ],
    );
  }

  // Column _hotelDescription(Size _screenSize, Hotel hotel) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Hotel Description",
  //         style: TextStyle(
  //           decoration: TextDecoration.none,
  //           color: Colors.black,
  //           fontFamily: 'Satoshi Variable',
  //           fontSize: _screenSize.height * 0.05,
  //           fontWeight: FontWeight.w700,
  //           height: 57 / 42, // line-height / font-size
  //           letterSpacing: -0.9034286141395569,
  //         ),
  //       ),
  //       SizedBox(
  //         height: _screenSize.height * 0.02,
  //       ),
  //       Text(
  //         hotel.description!,
  //         style: TextStyle(
  //           decoration: TextDecoration.none,
  //           color: Colors.black,
  //           fontFamily: 'Satoshi Variable',
  //           fontSize: _screenSize.width * 0.015,
  //           fontWeight: FontWeight.w700,
  //           height: 43.2 / 32, // line-height / font-size
  //           letterSpacing: -0.9,
  //         ),
  //       ),
  //       SizedBox(
  //         height: _screenSize.height * 0.06,
  //       ),
  //     ],
  //   );
  // }

  Column _roomCardScroller(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Room Available",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'Satoshi Variable',
            fontSize: _screenSize.height * 0.05,
            fontWeight: FontWeight.w700,
            height: 57 / 42, // line-height / font-size
            letterSpacing: -0.9034286141395569,
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.02,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(4, (index) {
            return _roomCard(Size(1300, 850));
          })),
        )
      ],
    );
  }

  Container _roomCard(Size _screenSize) {
    return Container(
      padding: EdgeInsets.only(
          bottom: _screenSize.width * 0.025,
          right: _screenSize.width * 0.05,
          left: 0),
      child: Container(
        width: _screenSize.width * 0.3,
        padding: EdgeInsets.only(
            left: _screenSize.width * 0.03,
            right: _screenSize.width * 0.03,
            top: _screenSize.width * 0.02),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0.5),
            borderRadius: BorderRadius.circular(_screenSize.width * 0.01)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _headingText(_screenSize),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _roomDetails(_screenSize),
                _priceDetails(_screenSize),
              ],
            ),
            _bookButton(_screenSize),
          ],
        ),
      ),
    );
  }

  Row _bookButton(Size _screenSize) {
    final theme = ThemeData(
      dialogTheme: DialogTheme(
        backgroundColor: Colors.white, // Set your desired background color here
      ),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            padding: EdgeInsets.only(
                top: _screenSize.width * 0.02,
                bottom: _screenSize.width * 0.02),
            width: _screenSize.width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.white;
                    else
                      return Colors.blue;
                  }), foregroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.blue;
                    else
                      return Colors.white;
                  })),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: _screenSize.width * 0.02,
                      right: _screenSize.width * 0.02,
                      top: _screenSize.width * 0.01,
                      bottom: _screenSize.width * 0.01,
                    ),
                    width: _screenSize.width * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Book",
                          style: TextStyle(
                              fontSize: _screenSize.width * 0.013,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => Theme(
                        data: theme,
                        child: AlertDialog(
                          content: ReviewBook(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            )),
      ],
    );
  }

  AlertDialog _bookAlert() {
    return const AlertDialog(content: ReviewBook());
  }

  Column _headingText(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Luxe Double Room",
          style: TextStyle(
            fontSize: _screenSize.width * 0.016,
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'Satoshi Variable',

            fontWeight: FontWeight.w700,
            height: 43 / 32, // line-height / font-size
            letterSpacing: -0.9034286141395569,
          ),
        ),
        Row(
          children: [
            Icon(Icons.group_outlined,
                color: Colors.black, size: _screenSize.width * 0.02),
            SizedBox(
              width: _screenSize.width * 0.004,
            ),
            Text(
              "For 2 Adults",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: _screenSize.width * 0.014,
                fontWeight: FontWeight.w400,
                height: 35 / 26, // line-height / font-size
                letterSpacing: -0.8015938997268677,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column _roomDetails(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: _screenSize.width * 0.004,
            ),
            SizedBox(
              width: _screenSize.width * 0.004,
            ),
            Text(
              "Room Only",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: _screenSize.width * 0.014,
                fontWeight: FontWeight.w400,
                height: 35 / 26, // line-height / font-size
                letterSpacing: -0.8015938997268677,
              ),
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: _screenSize.width * 0.004,
            ),
            SizedBox(
              width: _screenSize.width * 0.004,
            ),
            Text(
              "Non Refundable",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: _screenSize.width * 0.014,
                fontWeight: FontWeight.w400,
                height: 35 / 26, // line-height / font-size
                letterSpacing: -0.8015938997268677,
              ),
            ),
          ],
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: _screenSize.width * 0.004,
            ),
            SizedBox(
              width: _screenSize.width * 0.004,
            ),
            Text(
              "Breakfast",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.014,
                fontWeight: FontWeight.w400,
                height: 35 / 26, // line-height / font-size
                letterSpacing: -0.8015938997268677,
              ),
            ),
          ],
        ),
      ],
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

  Container _hotelDetailsSection(Size _screenSize, Hotel hotel) {
    return Container(
      width: _screenSize.width * 0.95,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _hotelDemographics(hotel, _screenSize),
              SizedBox(
                height: _screenSize.height * 0.04,
              ),
              Container(
                width: _screenSize.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Amenities",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.width * 0.019,
                        fontWeight: FontWeight.w700,
                        height: 1.25,
                        letterSpacing: -0.408,
                      ),
                    ),
                    SizedBox(
                      height: _screenSize.height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _foodColumn(_screenSize),
                        _carColumn(_screenSize),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          _mapColumn(_screenSize),
        ],
      ),
    );
  }

  Column _mapColumn(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _shareButton(_screenSize),
            _likeButton(_screenSize),
          ],
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage(
                    "/images/map.jpg",
                  ),
                  fit: BoxFit.cover)),
          height: _screenSize.height * 0.32,
          width: _screenSize.width * 0.5,
        )
      ],
    );
  }

  Container _likeButton(Size _screenSize) {
    return Container(
        padding: EdgeInsets.all(_screenSize.width * 0.015),
        width: _screenSize.width * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue;
                else
                  return Colors.white;
              }), foregroundColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.white;
                else
                  return Colors.blue;
              })),
              child: Row(
                children: [
                  const Icon(Icons.thumb_up_outlined),
                  Text(
                    "Like",
                    style: TextStyle(
                        fontSize: _screenSize.width * 0.013,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ));
  }

  Container _shareButton(Size _screenSize) {
    return Container(
        padding: EdgeInsets.all(_screenSize.width * 0.015),
        width: _screenSize.width * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.blue;
                else
                  return Colors.white;
              }), foregroundColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.hovered))
                  return Colors.white;
                else
                  return Colors.blue;
              })),
              child: Row(
                children: [
                  const Icon(Icons.share_outlined),
                  Text(
                    "Share",
                    style: TextStyle(
                        fontSize: _screenSize.width * 0.013,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ],
        ));
  }

  Container _carColumn(Size _screenSize) {
    return Container(
      width: _screenSize.width * 0.1,
      height: _screenSize.height * 0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: _screenSize.width * 0.084,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.car_crash_outlined),
                Text(
                  "Hotel Car",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.016,
                    fontWeight: FontWeight.w500,
                    height: 46 / 34, // line-height / font-size
                    letterSpacing: -0.9034286141395569,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: _screenSize.width * 0.084,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.car_crash_outlined),
                Text(
                  "Hotel Car",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.016,
                    fontWeight: FontWeight.w500,
                    height: 46 / 34, // line-height / font-size
                    letterSpacing: -0.9034286141395569,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _foodColumn(Size _screenSize) {
    return Container(
      width: _screenSize.width * 0.1,
      height: _screenSize.height * 0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: _screenSize.width * 0.055,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.restaurant_outlined),
                Text(
                  "Food",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.016,
                    fontWeight: FontWeight.w500,
                    height: 46 / 34, // line-height / font-size
                    letterSpacing: -0.9034286141395569,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: _screenSize.width * 0.055,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.restaurant_outlined),
                Text(
                  "Food",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.016,
                    fontWeight: FontWeight.w500,
                    height: 46 / 34, // line-height / font-size
                    letterSpacing: -0.9034286141395569,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _hotelDemographics(Hotel hotel, Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hotel.name,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'Satoshi Variable',
            fontSize: _screenSize.width * 0.025,
            fontWeight: FontWeight.w700,
            height: 1.25,
            letterSpacing: -0.408,
          ),
        ),
        Text(
          hotel.place,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontFamily: 'Satoshi Variable',
            fontSize: _screenSize.width * 0.015,
            fontWeight: FontWeight.w400,
            height: 43 / 32, // line-height / font-size
            letterSpacing: -0.408,
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Wrap(
                  children: List.generate(5, (index) {
                    double size = _screenSize.height / 30;
                    double stars = 3.5;
                    int wholeRating = stars.floor();
                    int fractRating = ((stars - wholeRating) * 10).ceil();
                    if (index < wholeRating) {
                      return Icon(Icons.star, color: Colors.amber, size: size);
                    } else if (index == wholeRating) {
                      return SizedBox(
                        height: size,
                        width: size,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: size,
                            ),
                            ClipRect(
                              clipper: Clipper(part: fractRating),
                              child: Icon(
                                Icons.star,
                                color: grey,
                                size: size,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Icon(Icons.star, color: grey, size: size);
                    }
                  }),
                ),
              ],
            ),
            SizedBox(
              width: _screenSize.width * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFFDA4167),
              ),
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              child: Text(hotel.rating.toString() + "/5",
                  style: const TextStyle(
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
      ],
    );
  }

  Column _popularImages(Size _screenSize) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            _showcaseImages(_screenSize),
            Container(
                padding: EdgeInsets.all(_screenSize.width * 0.015),
                width: _screenSize.width * 0.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue;
                        else
                          return Colors.white;
                      }), foregroundColor:
                          MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.white;
                        else
                          return Colors.blue;
                      })),
                      child: Row(
                        children: [
                          const Icon(Icons.image_outlined),
                          Text(
                            "132 +",
                            style: TextStyle(
                                fontSize: _screenSize.width * 0.013,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ],
                )),
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.04,
        ),
      ],
    );
  }

  Container _showcaseImages(Size _screenSize) {
    return Container(
      width: _screenSize.width * 0.95,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: _screenSize.width * 0.493,
            height: _screenSize.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: _screenSize.width * 0.4,
            height: _screenSize.height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: _screenSize.width * 0.4,
                  height: _screenSize.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: _screenSize.width * 0.4,
                        height: _screenSize.height * (0.2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: _screenSize.width * 0.198,
                              height: _screenSize.height * (0.19),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1543968332-f99478b1ebdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: _screenSize.width * 0.198,
                              height: _screenSize.height * (0.19),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1573047330191-fb342b1be381?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _screenSize.width * 0.4,
                        height: _screenSize.height * (0.2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: _screenSize.width * 0.198,
                              height: _screenSize.height * (0.19),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1606046604972-77cc76aee944?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80"),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              width: _screenSize.width * 0.198,
                              height: _screenSize.height * (0.19),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: NetworkImage(
                                          "https://images.unsplash.com/photo-1584132967334-10e028bd69f7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: _screenSize.width * 0.4,
                  height: _screenSize.height * 0.39,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1625244724120-1fd1d34d00f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
        ],
      ),
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
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 24,
                color: Colors.blue,
              ),
            ),
            addHorizontalySpace(15),
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
                      padding: const EdgeInsets.fromLTRB(6, 9, 6, 9),
                      child: Text('Host your property', style: txtStyle),
                    ),
                    style: ButtonStyle(foregroundColor:
                        MaterialStateColor.resolveWith((states) {
                      return Colors.blue;
                    })),
                  ),
                  IconButton(
                    icon: const Icon(
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
}
