import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  Color _primaryColor = Color(0xFFE1F3FF);
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
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
              children: [
                _titleBar(_screenSize),
                _mainBanner(_screenSize),
                Container(
                  padding: EdgeInsets.only(bottom: _screenSize.height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _topicCard(
                          _screenSize,
                          "Establish a mission statement.",
                          "Your About page can and will be more comprehensive than a single mission statement, but to draw people in, you need to succinctly state your goal in the industry upfront. What is your business here to do? Why should your website visitors care? This information will give the reader something to remember about your company long after they leave your website.Your About page can and will be more comprehensive than a single mission statement, but to draw people in, you need to succinctly state your goal in the industry upfront. What is your business here to do? Why should your website visitors care? This information will give the reader something to remember about your company long after they leave your website.",
                          _screenSize.width * 0.44),
                      _topicCard(
                          _screenSize,
                          "Establish a mission statement.",
                          "Your About page can and will be more comprehensive than a single mission statement, but to draw people in, you need to succinctly state your goal in the industry upfront. What is your business here to do? Why should your website visitors care? This information will give the reader something to remember about your company long after they leave your website.Your About page can and will be more comprehensive than a single mission statement, but to draw people in, you need to succinctly state your goal in the industry upfront. What is your business here to do? Why should your website visitors care? This information will give the reader something to remember about your company long after they leave your website.",
                          _screenSize.width * 0.44)
                    ],
                  ),
                ),
                _topicCard(
                    _screenSize,
                    "Our Mission",
                    "Your About page can and will be more comprehensive than a single mission statement, but to draw people in, you need to succinctly state your goal in the industry upfront. What is your business here to do? Why should your website visitors care? This information will give the reader something to remember about your company long after they leave your website.Your About page can and will be more comprehensive than a single mission statement, but to draw people in, you need to succinctly state your goal in the industry upfront. What is your business here to do? Why should your website visitors care? This information will give the reader something to remember about your company long after they leave your website.",
                    _screenSize.width * 0.95),
                SizedBox(height: _screenSize.height*0.02,),
                _pageFooter(_screenSize),
              ],
            ),
          )),
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

  Container _topicCard(
      Size _screenSize, String title, String description, double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Color(0xFFFCFDFF),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ]),
      padding: EdgeInsets.all(_screenSize.width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Satoshi Variable',
              fontSize: _screenSize.width * 0.02,
              fontWeight: FontWeight.w700,
              height: 1.346,
              letterSpacing: -1.319239854812622,
            ),
          ),
          Container(
            child: AutoSizeText(description,
                style: TextStyle(
                  fontFamily: 'Satoshi Variable',
                  fontSize: _screenSize.width * 0.015,
                  fontWeight: FontWeight.w400,
                  height: 1.357,
                  letterSpacing: -1.319239854812622,
                )),
          ),
        ],
      ),
    );
  }

  Padding _mainBanner(Size _screenSize) {
    return Padding(
      padding: EdgeInsets.only(bottom: _screenSize.height * 0.03),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFFCFDFF),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ]),
        padding: EdgeInsets.all(_screenSize.width * 0.03),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: _screenSize.height * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Us",
                        style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'Satoshi Variable',
                          fontSize: _screenSize.width * 0.02,
                          fontWeight: FontWeight.w700,
                          height: 1.357,
                          letterSpacing: -1.319239854812622,
                        )),
                    Container(
                      width: _screenSize.width * 0.5,
                      height: _screenSize.height * 0.4,
                      child: Image.asset("images/wehelps.png"),
                    )
                  ],
                ),
              ),
              Container(
                width: _screenSize.width * 0.3,
                height: _screenSize.height * 0.6,
                child: Image.asset("images/traveller.png"),
              ),
            ]),
      ),
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
                      onPressed: () {
                        setState() {
                          _primaryColor = Colors.red;
                        }
                      },
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
          height: _screenSize.height * 0.03,
        )
      ],
    );
  }
}
