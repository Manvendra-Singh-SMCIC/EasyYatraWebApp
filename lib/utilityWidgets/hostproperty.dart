import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hotel_management_webapp/utils/constant.dart';
import 'commonWidgets.dart';

class HostProperty extends StatefulWidget {
  const HostProperty({super.key});

  @override
  State<HostProperty> createState() => _HostPropertyState();
}

class _HostPropertyState extends State<HostProperty> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          Navigator.pop(context);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(_screenSize.width * 0.02),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          padding: EdgeInsets.fromLTRB(
              _screenSize.width * 0.05,
              _screenSize.width * 0.02,
              _screenSize.width * 0.05,
              _screenSize.width * 0.02),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _titleBar(_screenSize),
            Container(
              width: _screenSize.width * 0.4,
              height: _screenSize.height * 0.07,
              child: Image.asset('/images/hostProp.png'),
            ),
            SizedBox(
              height: _screenSize.height * 0.08,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  _screenSize.width * 0.1,
                  _screenSize.width * 0.005,
                  _screenSize.width * 0.13,
                  _screenSize.width * 0.005),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: _screenSize.width * 0.3,
                        height: _screenSize.height * 0.05,
                        child: Image.asset('/images/downloadTxt.png'),
                      ),
                      SizedBox(
                        height: _screenSize.height * 0.02,
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: _screenSize.width * 0.017),
                        width: _screenSize.width * 0.3,
                        height: _screenSize.height * 0.1,
                        child: Image.asset('/images/downloadapp.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: _screenSize.height * 0.02,
                          ),
                          Container(
                            width: _screenSize.width * 0.1,
                            child: Image.asset('/images/wayTxt.png'),
                          ),
                          SizedBox(
                            height: _screenSize.height * 0.02,
                          ),
                          Container(
                            width: _screenSize.width * 0.23,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 134,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: _screenSize.width * 0.1,
                                        child: Image.asset(
                                            '/images/playstore.png'),
                                      ),
                                      Container(
                                        width: _screenSize.width * 0.1,
                                        child:
                                            Image.asset('/images/appstore.png'),
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
                  Container(
                    width: _screenSize.width * 0.2,
                    height: _screenSize.height * 0.5,
                    child: Image.asset('/images/mobile.png'),
                  ),
                ],
              ),
            ),
            addVerticalSpace(_screenSize.width * 0.008 - 4),
            GestureDetector(
              onTap: () => goBack(context),
              child: Center(
                child: Text(
                  "Maybe later",
                  style: kBodyText22bold(Colors.blue.shade300),
                ),
              ),
            )
          ]),
        ),
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
                  IconButton(
                      icon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.blue,
                        size: 30,
                      ),
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => ProfilePopup(context));
                        // showPlatformDialog(
                        //     context: context,
                        //     builder: (_) => const ProfilePopup());
                      }),
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
