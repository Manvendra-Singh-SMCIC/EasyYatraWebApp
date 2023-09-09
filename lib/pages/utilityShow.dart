// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hotel_management_webapp/pages/contactus.dart';
import 'package:flutter_hotel_management_webapp/pages/hoteldetailpage.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'package:flutter_hotel_management_webapp/utilityWidgets/review_and_book.dart';
import 'package:flutter_hotel_management_webapp/utils/constant.dart';

class ShowUtility extends StatefulWidget {
  const ShowUtility({super.key});

  @override
  State<ShowUtility> createState() => _ShowUtilityState();
}

class _ShowUtilityState extends State<ShowUtility> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              _screenSize.width * 0.05, 20, _screenSize.width * 0.05, 20),
          child: Column(
            children: [
              // pricepage(_screenSize),
              _alertMessage(Size(1920, 1455)),
            ],
          ),
        ),
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Container _alertMessage(Size _screenSize) {
    return Container(
      width: _screenSize.width * 0.4,
      padding: EdgeInsets.all(_screenSize.width * 0.02),
      child: Column(
        children: [
          Image.asset("/images/alert.png"),
          SizedBox(
            height: _screenSize.height * 0.015,
          ),
          Text(
            "Something went wrong...",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: _screenSize.width * 0.015,
              fontWeight: FontWeight.w600,
              height: 1.33, // equivalent to line-height: 24px
              letterSpacing: 0.0,
            ),
          ),
          SizedBox(
            height: _screenSize.height * 0.015,
          ),
          AutoSizeText(
            "We had some trouble loading this page. Please refresh the page to try again or get in touch if the problem sticks around!",
            style: TextStyle(
              fontFamily: 'Satoshi Variable',
              fontSize: _screenSize.width * 0.012,
              fontWeight: FontWeight.w400,
              height: 1.25, // equivalent to line-height: 20px
              letterSpacing: 0.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: _screenSize.height * 0.015,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.blue.shade800;
                          return Colors.blue;
                        }),
                        foregroundColor:
                            MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.hovered))
                            return Colors.white;
                          return Colors.white;
                        }),
                        shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8.0), // Set the desired border radius
                          ),
                        )),
                    onPressed: () {
                      nextScreen(context, ContactUs());
                    },
                    child: Container(
                      padding: EdgeInsets.all(_screenSize.width * 0.01),
                      width: _screenSize.width * 0.15,
                      child: Center(
                          child: Text(
                        "Contact support",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          height: 1.25, // equivalent to line-height: 20px
                          letterSpacing: 0.0,
                        ),
                      )),
                    )),
                TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Set the desired border radius
                        ),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.blue.shade800;
                        return Colors.blue;
                      }),
                      foregroundColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.hovered))
                          return Colors.white;
                        return Colors.white;
                      })),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ContactUs()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(_screenSize.width * 0.01),
                    width: _screenSize.width * 0.15,
                    child: Center(
                      child: Text(
                        "Refresh Page",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          height: 1.25, // equivalent to line-height: 20px
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Container pricepage(Size _screenSize) {
  //   return ;
  // }
}

class PricePage extends StatefulWidget {
  const PricePage({super.key});

  @override
  State<PricePage> createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  List<bool> paymentMethods = [false, false, false, false];
  int selectedMethod = 0;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return SelectionArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(_screenSize.width * 0.03),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _priceDetails(_screenSize),
                SizedBox(
                  height: _screenSize.height * 0.03,
                ),
                _paymentMethods(_screenSize),
                addVerticalSpace(20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Add your logic here for handling the "Pay Now" button press
                    },
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _paymentMethods(Size _screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
      ),
      padding: EdgeInsets.all(_screenSize.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(_screenSize.width * 0.005),
            child: Text(
              "Payment Method",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.015,
                fontWeight: FontWeight.w700,
                height: 1.33, // line-height equivalent: 57px / 42px = 1.33
                letterSpacing:
                    -0.408, // -0.40799999237060547px rounded to three decimal places
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(_screenSize.width * 0.02),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Radio(
                    value: paymentMethods[0],
                    groupValue: true,
                    onChanged: (e) {
                      paymentMethods.fillRange(0, paymentMethods.length, false);
                      paymentMethods[0] = true;
                      selectedMethod = 0;
                      setState(() {});
                    },
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                  ),
                  Text(
                    "Debit / Credit card",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: _screenSize.width * 0.013,
                      fontWeight: FontWeight.w500,
                      height:
                          1.36, // line-height equivalent: 49px / 36px = 1.36
                      letterSpacing:
                          -0.408, // -0.40799999237060547px rounded to three decimal places
                    ),
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      _screenSize.width * 0.04,
                      _screenSize.width * 0.01,
                      _screenSize.width * 0.08,
                      _screenSize.width * 0.01),
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF0F0F0),
                      ),
                      padding: EdgeInsets.fromLTRB(
                          _screenSize.width * 0.01,
                          _screenSize.width * 0.005,
                          _screenSize.width * 0.1,
                          _screenSize.width * 0.005),
                      child: DropdownButton(
                        dropdownColor: Color(0xFFF0F0F0),
                        underline: Container(),
                        value: 1,
                        items: [
                          DropdownMenuItem(
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xFFF0F0F0)),
                              width: _screenSize.width * 0.4,
                              child: Text("card 1",
                                  style: TextStyle(
                                    fontFamily: 'Satoshi Variable',
                                    fontSize: _screenSize.width * 0.013,
                                    fontWeight: FontWeight.w600,
                                    height:
                                        1.36, // line-height equivalent: 49px / 36px = 1.36
                                    letterSpacing:
                                        -0.408, // -0.40799999237060547px rounded to three decimal places
                                  )),
                            ),
                            value: 1,
                          )
                        ],
                        onChanged: (e) {},
                      ),
                    ),
                  )),
              Row(
                children: [
                  Radio(
                    value: paymentMethods[1],
                    groupValue: true,
                    onChanged: (e) {
                      paymentMethods.fillRange(0, paymentMethods.length, false);
                      paymentMethods[1] = true;
                      selectedMethod = 1;
                      setState(() {});
                    },
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                  ),
                  Text(
                    "Net Banking",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: _screenSize.width * 0.013,
                      fontWeight: FontWeight.w500,
                      height:
                          1.36, // line-height equivalent: 49px / 36px = 1.36
                      letterSpacing:
                          -0.408, // -0.40799999237060547px rounded to three decimal places
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: paymentMethods[2],
                    groupValue: true,
                    onChanged: (e) {
                      paymentMethods.fillRange(0, paymentMethods.length, false);
                      paymentMethods[2] = true;
                      selectedMethod = 2;
                      setState(() {});
                    },
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                  ),
                  Text(
                    "UPI ( PhonePay, Amazon Pay Google Pay etc)",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: _screenSize.width * 0.013,
                      fontWeight: FontWeight.w500,
                      height:
                          1.36, // line-height equivalent: 49px / 36px = 1.36
                      letterSpacing:
                          -0.408, // -0.40799999237060547px rounded to three decimal places
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: paymentMethods[3],
                    groupValue: true,
                    onChanged: (e) {
                      paymentMethods.fillRange(0, paymentMethods.length, false);
                      paymentMethods[3] = true;
                      selectedMethod = 3;
                      setState(() {});
                    },
                    fillColor:
                        MaterialStateColor.resolveWith((states) => Colors.blue),
                  ),
                  Text(
                    "Wallets",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: _screenSize.width * 0.013,
                      fontWeight: FontWeight.w500,
                      height:
                          1.36, // line-height equivalent: 49px / 36px = 1.36
                      letterSpacing:
                          -0.408, // -0.40799999237060547px rounded to three decimal places
                    ),
                  )
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }

  Container _priceDetails(Size _screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
      ),
      padding: EdgeInsets.all(_screenSize.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(_screenSize.width * 0.005),
            child: Text(
              "Price Details",
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                fontSize: _screenSize.width * 0.015,
                fontWeight: FontWeight.w700,
                height: 1.33, // line-height equivalent: 57px / 42px = 1.33
                letterSpacing:
                    -0.408, // -0.40799999237060547px rounded to three decimal places
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(_screenSize.width * 0.005),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "1 room x 1 night",
                      style: TextStyle(
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.width * 0.015,
                        fontWeight: FontWeight.w500,
                        height:
                            1.33, // line-height equivalent: 57px / 42px = 1.33
                        letterSpacing:
                            -0.408, // -0.40799999237060547px rounded to three decimal places
                      ),
                    ),
                    Text(
                      "₹14,800",
                      style: TextStyle(
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.width * 0.015,
                        fontWeight: FontWeight.w500,
                        height:
                            1.33, // line-height equivalent: 57px / 42px = 1.33
                        letterSpacing:
                            -0.408, // -0.40799999237060547px rounded to three decimal places
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Taxes",
                      style: TextStyle(
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.width * 0.015,
                        fontWeight: FontWeight.w500,
                        height:
                            1.33, // line-height equivalent: 57px / 42px = 1.33
                        letterSpacing:
                            -0.408, // -0.40799999237060547px rounded to three decimal places
                      ),
                    ),
                    Text(
                      "₹1,800",
                      style: TextStyle(
                        fontFamily: 'Satoshi Variable',
                        fontSize: _screenSize.width * 0.015,
                        fontWeight: FontWeight.w500,
                        height:
                            1.33, // line-height equivalent: 57px / 42px = 1.33
                        letterSpacing:
                            -0.408, // -0.40799999237060547px rounded to three decimal places
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(_screenSize.width * 0.005),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.014,
                    fontWeight: FontWeight.w700,
                    height: 1.33, // line-height equivalent: 57px / 42px = 1.33
                    letterSpacing:
                        -0.408, // -0.40799999237060547px rounded to three decimal places
                  ),
                ),
                Text(
                  "₹16,600",
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.014,
                    fontWeight: FontWeight.w700,
                    height: 1.33, // line-height equivalent: 57px / 42px = 1.33
                    letterSpacing:
                        -0.408, // -0.40799999237060547px rounded to three decimal places
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
