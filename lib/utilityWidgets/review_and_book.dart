// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hotel_management_webapp/pages/utilityShow.dart';
import 'package:flutter_hotel_management_webapp/utils/constant.dart';

class ReviewBook extends StatefulWidget {
  const ReviewBook({super.key});

  @override
  State<ReviewBook> createState() => _ReviewBookState();
}

class _ReviewBookState extends State<ReviewBook> {
  bool checboxValue = false;
  List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  @override
  Widget build(BuildContext context) {
    // Size _screenSize = MediaQuery.of(context).size;
    Size _screenSize = Size(680, 470);
    return Material(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 1100,
          height: 420,
          padding: EdgeInsets.all(_screenSize.width * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Review and Book",
                style: TextStyle(
                  fontFamily: 'Satoshi Variable',
                  fontSize: _screenSize.width * 0.030,
                  fontWeight: FontWeight.w700,
                  height: 1.333,
                  letterSpacing: -0.40799999237060547,
                ),
              ),
              SizedBox(
                height: _screenSize.height * 0.02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  // width: 870,
                  // decoration: BoxDecoration(color: Colors.black),
                  padding: EdgeInsets.all(_screenSize.width * 0.023),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Room 1",
                                style: TextStyle(
                                  fontFamily: 'Satoshi Variable',
                                  fontSize: _screenSize.width * 0.025,
                                  fontWeight: FontWeight.w700,
                                  height: 1.333,
                                  letterSpacing: -0.40799999237060547,
                                ),
                              ),
                              Text(
                                ": 2 Adults, 1 Queen Bed, Non-smoking",
                                style: TextStyle(
                                  fontFamily: 'Satoshi Variable',
                                  fontWeight: FontWeight.w500,
                                  fontSize: _screenSize.width * 0.020,
                                  height: 1.35,
                                  letterSpacing: -0.9,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _screenSize.height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "Free Parking",
                                style: TextStyle(
                                    fontFamily: 'Satoshi Variable',
                                    fontSize: _screenSize.width * 0.025,
                                    fontWeight: FontWeight.w500,
                                    height: 1.346,
                                    letterSpacing: -0.9034286141395569,
                                    color: Color(0xFF12B347)),
                              ),
                              SizedBox(
                                width: _screenSize.width * 0.008,
                              ),
                              Text(
                                "Free Wifi",
                                style: TextStyle(
                                  color: Color(0xFF12B347),
                                  fontFamily: 'Satoshi Variable',
                                  fontSize: _screenSize.width * 0.025,
                                  fontWeight: FontWeight.w500,
                                  height: 1.346,
                                  letterSpacing: -0.9034286141395569,
                                ),
                              ),
                            ],
                          ),
                          addVerticalSpace(10),
                          _input(
                            _screenSize,
                            controller[0],
                            inputTitle: "First name",
                          ),
                          _input(
                            _screenSize,
                            controller[1],
                            inputTitle: "Last name",
                          ),
                          _input(
                            _screenSize,
                            controller[2],
                            inputTitle: "Mobile number",
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: checboxValue,
                                  onChanged: (e) {
                                    setState(() {
                                      checboxValue = e!;
                                    });
                                  }),
                              Text(
                                "Receive text alerts about this booking",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Satoshi Variable',
                                  fontSize: _screenSize.width * 0.021,
                                  fontWeight: FontWeight.w500,
                                  height: 1.333,
                                  letterSpacing: -0.40799999237060547,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: _screenSize.width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _roomCard(_screenSize),
                          SizedBox(
                            height: _screenSize.height * 0.01,
                          ),
                          TextButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Set the desired border radius
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.blue.shade700;
                                  else
                                    return Colors.blue;
                                }),
                                foregroundColor:
                                    MaterialStateColor.resolveWith((states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.blue;
                                  else
                                    return Colors.white;
                                })),
                            onPressed: () {
                              replaceScreen(context, PricePage());
                            },
                            child: Container(
                              height: _screenSize.height * 0.08,
                              width: _screenSize.width * 0.330,
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Satoshi Variable',
                                    fontSize: _screenSize.width * 0.02,
                                    fontWeight: FontWeight.w700,
                                    height: 1.361,
                                    letterSpacing: -0.8015938997268677,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pricePop() {
    // return AlertDialog(
    //   content: PricePage(),
    // );
    return showDialog(
      context: context,
      builder: (context) => PricePage(),
    );
  }

  Column _input(Size _screenSize, TextEditingController controller,
      {required String inputTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(inputTitle,
            style: TextStyle(
              fontFamily: 'Satoshi Variable',
              fontSize: _screenSize.width * 0.020,
              fontWeight: FontWeight.w500,
              height: 1.94,
              letterSpacing: -0.9034286141395569,
            )),
        SizedBox(
          height: _screenSize.height * 0.01,
        ),
        Container(
          width: _screenSize.width * 0.40,
          height: _screenSize.height * 0.07,
          decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10)),
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.02,
        )
      ],
    );
  }

  Container _roomCard(Size _screenSize) {
    return Container(
      padding: EdgeInsets.only(
          bottom: _screenSize.width * 0.025,
          right: _screenSize.width * 0.03,
          left: 0),
      child: Container(
        height: _screenSize.width * 0.25,
        width: _screenSize.width * 0.35,
        padding: EdgeInsets.only(
            left: _screenSize.width * 0.02,
            right: _screenSize.width * 0.02,
            top: _screenSize.width * 0.02,
            bottom: _screenSize.width * 0.02),
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
          ],
        ),
      ),
    );
  }

  Column _headingText(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Luxe Double Room",
          style: TextStyle(
            fontSize: _screenSize.width * 0.020,
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
                fontSize: _screenSize.width * 0.017,
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
                fontSize: _screenSize.width * 0.019,
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
                fontSize: _screenSize.width * 0.017,
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
                fontSize: _screenSize.width * 0.03,
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
              fontSize: _screenSize.width * 0.02,
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
                fontSize: _screenSize.width * 0.02,
                fontWeight: FontWeight.w500,
                height: 27 /
                    20, // Line height calculated by dividing line height by font size
                letterSpacing: -0.802,
              )),
        ],
      ),
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
                fontSize: _screenSize.width * 0.019,
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
                fontSize: _screenSize.width * 0.019,
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
                fontSize: _screenSize.width * 0.019,
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
}
