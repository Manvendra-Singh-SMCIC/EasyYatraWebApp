import 'package:flutter/material.dart';

class BookingsTrips extends StatefulWidget {
  const BookingsTrips({super.key});

  @override
  State<BookingsTrips> createState() => _BookingsTripsState();
}

class _BookingsTripsState extends State<BookingsTrips> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    _screenSize.width * 0.05,
                    _screenSize.height * 0.01,
                    _screenSize.width * 0.05,
                    _screenSize.height * 0.01),
                child: _titleBar(_screenSize),
              ),
              Container(
                color: Color(0xFFEEF7FF),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      _screenSize.width * 0.05,
                      _screenSize.height * 0.04,
                      _screenSize.width * 0.05,
                      _screenSize.height * 0.01),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bookings and Trips",
                            style: TextStyle(
                              fontFamily: 'Satoshi Variable',
                              fontSize: _screenSize.width * 0.02,
                              fontWeight: FontWeight.w700,
                              height: 1.357,
                              letterSpacing: -1.319239854812622,
                            )),
                        SizedBox(
                          height: _screenSize.height * 0.01,
                        ),
                        Row(
                          children: [
                            Text("Upcoming",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Satoshi Variable',
                                  fontSize: _screenSize.width * 0.01,
                                  fontWeight: FontWeight.w700,
                                  height: 1.357,
                                  letterSpacing: 0,
                                )),
                            SizedBox(
                              width: _screenSize.width * 0.01,
                            ),
                            Text("Post Bookings",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Satoshi Variable',
                                  fontSize: _screenSize.width * 0.01,
                                  fontWeight: FontWeight.w700,
                                  height: 1.357,
                                  letterSpacing: 0,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: _screenSize.height * 0.04,
                        ),
                        _bookingCard(_screenSize),
                        _bookingCard(_screenSize),
                      ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                      _screenSize.width * 0.05,
                      _screenSize.height * 0.04,
                      _screenSize.width * 0.05,
                      _screenSize.height * 0.01),
                child: _pageFooter(_screenSize),
              ),
            ],
          )),
    );
  }

  Column _bookingCard(Size _screenSize) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: _screenSize.width * 0.95,
          padding: EdgeInsets.all(_screenSize.width * 0.02),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "12 Sep 2022",
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.01,
                    fontWeight: FontWeight.w500,
                    height: 2.583,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  "The Westin Mubai Garden City",
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.015,
                    fontWeight: FontWeight.w700,
                    height: 1.344,
                    letterSpacing: -0.40799999237060547,
                  ),
                ),
                Text(
                  "Goregaon",
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.01,
                    fontWeight: FontWeight.w500,
                    height: 2.583,
                    letterSpacing: 0,
                  ),
                ),
                SizedBox(
                  height: _screenSize.height * 0.025,
                ),
                Text("Booking ID - 2348282942",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: _screenSize.width * 0.013,
                      fontWeight: FontWeight.w400,
                      height: 1.344,
                      letterSpacing: -0.40799999237060547,
                    )),
                SizedBox(
                  height: _screenSize.height * 0.01,
                ),
                TextButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.white;
                      else
                        return Color(0xFFFF4B26);
                    }), foregroundColor:
                        MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.hovered))
                        return Color(0xFFFF4B26);
                      else
                        return Colors.white;
                    })),
                    onPressed: () {},
                    child: Container(
                      child: Text("Cancel Booking"),
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "2 Adults - 1 Luxe room",
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: _screenSize.width * 0.014,
                    fontWeight: FontWeight.w700,
                    height: 1.361,
                    color: Colors.blue,
                    letterSpacing: -0.40799999237060547,
                  ),
                ),
                SizedBox(
                  height: _screenSize.height * 0.1,
                ),
                Row(
                  children: [
                    Text("Anount Paid - ",
                        style: TextStyle(
                          fontFamily: 'Satoshi Variable',
                          fontSize: _screenSize.width * 0.013,
                          fontWeight: FontWeight.w500,
                          height: 1.35,
                          letterSpacing: -0.41,
                        )),
                    Text("₹ 13,372.00",
                        style: TextStyle(
                          fontFamily: 'Satoshi Variable',
                          fontSize: _screenSize.width * 0.014,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                          letterSpacing: -0.41,
                        )),
                  ],
                ),
                SizedBox(
                  height: _screenSize.height * 0.01,
                ),
                TextButton(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.white;
                      else
                        return Colors.blue;
                    }), foregroundColor:
                        MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.hovered))
                        return Colors.blue;
                      else
                        return Colors.white;
                    })),
                    onPressed: () {},
                    child: Container(
                      child: Text("Send Booking Details via Message"),
                    )),
              ],
            )
          ]),
        ),
        SizedBox(
          height: _screenSize.height * 0.03,
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
                        Text('Easyatra provides good deals on'),
                        Text('hotel booking and provides you'),
                        Text('great and awesome offers.'),
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
                          Container(
                            width: _screenSize.width * 0.01,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("/images/1.png"))),
                          ),
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
                    Text('Customer Support'),
                    Text('Booking Details'),
                    Text('Terms & Conditions'),
                    Text('Privacy Policy'),
                  ],
                ),
              ),
            ],
          ),
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
}
