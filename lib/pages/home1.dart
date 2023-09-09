import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Color _primaryColor = Color(0xFFE1F3FF);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            _screenSize.width * 0.05, 20, _screenSize.width * 0.05, 20),
        child: Column(children: [
          _titleBar(_screenSize),
          _mainBanner(context, _screenSize),
          _searchFunctions(_screenSize),
          _travelHeading(_screenSize),
          _placeCircleAvatars(_screenSize),
          _downloadCard(_screenSize),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                    offset: Offset(0, 2),
                  ),
                ],
                color: Colors.white),
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                _subscribeCard(_screenSize),
                SizedBox(
                  height: 60,
                ),
                _contactSection(_screenSize),
              ],
            ),
          ),
        ]),
      ),
    ));
  }

  Row _contactSection(Size _screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          height: 180,
          padding: EdgeInsets.fromLTRB(
              0, _screenSize.height * 0.015, 0, _screenSize.height * 0.015),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              Text('About'),
              Text('Features'),
              Text('Works'),
              Text('Career'),
            ],
          ),
        ),
        Container(
          height: 180,
          padding: EdgeInsets.fromLTRB(
              0, _screenSize.height * 0.015, 0, _screenSize.height * 0.015),
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
        Container(
          height: 180,
          padding: EdgeInsets.fromLTRB(
              0, _screenSize.height * 0.015, 0, _screenSize.height * 0.017),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Resources',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: _screenSize.height * 0.01,
              ),
              Text('How to book hotels'),
            ],
          ),
        ),
      ],
    );
  }

  Stack _subscribeCard(Size _screenSize) {
    ButtonStyle btnStyle = ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered))
            return Colors.black;
          else
            return Colors.blue.shade600;
        }),
        foregroundColor:
            MaterialStateColor.resolveWith((states) => Colors.white));
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          child: Image.asset('/images/BG.jpg'),
        ),
        Column(
          children: [
            Image.asset('/images/subscribetxt.png'),
            SizedBox(
              height: 20,
            ),
            Container(
              width: _screenSize.width * 0.55,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Container(
                        height: 50,
                        width: _screenSize.width * 0.15,
                        child: Center(
                          child: Text(
                            'First name',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        )),
                    style: btnStyle,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                          height: 50,
                          width: _screenSize.width * 0.15,
                          child: Center(
                            child: Text(
                              'Email address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          )),
                      style: btnStyle),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                        height: 50,
                        width: _screenSize.width * 0.15,
                        child: Center(
                          child: Text(
                            'Subscribe Now',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        )),
                    style: btnStyle,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Column _downloadCard(Size _screenSize) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.grey,
                  offset: Offset(0, 2),
                ),
              ]),
          padding: EdgeInsets.all(_screenSize.width * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: _screenSize.width * 0.4,
                    child: Image.asset('/images/downloadTxt.png'),
                  ),
                  Container(
                    width: _screenSize.width * 0.5,
                    child: Image.asset('/images/bestDealTxt.png'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: _screenSize.width * 0.1,
                    child: Image.asset('/images/wayTxt.png'),
                  ),
                  Container(
                    width: _screenSize.width * 0.23,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 134,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _screenSize.width * 0.1,
                                child: Image.asset('/images/playstore.png'),
                              ),
                              Container(
                                width: _screenSize.width * 0.1,
                                child: Image.asset('/images/appstore.png'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 150,
                          width: _screenSize.width * 0.1,
                          child: Image.asset('/images/Vector.png'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: _screenSize.height * 0.07,
        )
      ],
    );
  }

  Column _placeCircleAvatars(Size _screenSize) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/1.jpg'),
              radius: _screenSize.width * 0.1,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/2.jpg'),
              radius: _screenSize.width * 0.1,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/3.jpg'),
              radius: _screenSize.width * 0.1,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/4.jpg'),
              radius: _screenSize.width * 0.1,
            ),
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.07,
        )
      ],
    );
  }

  Column _travelHeading(Size _screenSize) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: _screenSize.width * 0.4,
              height: 40,
              child: Image.asset("images/TraveTxt.png"),
            )
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.07,
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
          height: _screenSize.height * 0.07,
        )
      ],
    );
  }

  Column _mainBanner(BuildContext context, Size _screenSize) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: _primaryColor, borderRadius: BorderRadius.circular(30)),
          width: MediaQuery.of(context).size.width * 0.95,
          height: 400,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.asset(
                '/images/MainBannerTxt.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.asset(
                '/images/MainBannerImg.png',
                fit: BoxFit.contain,
              ),
            )
          ]),
        ),
        SizedBox(
          height: _screenSize.height * 0.07,
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
          if (states.contains(MaterialState.hovered)) return Color(0xFF3D99EE);
          return Colors.transparent;
        }),
        foregroundColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) return Colors.white;
          return Color(0xFF5E5E5E);
        }));
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                        child: Text('Host your property', style: txtStyle),
                      ),
                      style: mainActionButtonsStyle),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                      child: Text('Log In', style: txtStyle),
                    ),
                    style: mainActionButtonsStyle,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: EdgeInsets.fromLTRB(6, 9, 6, 9),
                      child: Text('Sign Up', style: txtStyle),
                    ),
                    style: mainActionButtonsStyle,
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
