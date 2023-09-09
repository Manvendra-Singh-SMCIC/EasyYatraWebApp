import 'package:flutter/material.dart';
import 'package:flutter_hotel_management_webapp/pages/hoteldetailpage.dart';
import 'package:flutter_hotel_management_webapp/utils/styles.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// COlORS

const primary = Color.fromRGBO(72, 17, 106, 1);
const primary2 = Color.fromRGBO(194, 32, 84, 1);
const boxColor = Color.fromRGBO(236, 235, 251, 1);
const textColor = Color.fromRGBO(164, 164, 164, 1);
const borderColor = Color.fromRGBO(211, 211, 211, 1);

const black = Colors.black;
const white = Colors.white;
const green = Color(0xff009206);
const blue = Color(0xff001241);
const skinColor = Color.fromRGBO(252, 207, 49, 0.25);

// COLOR for GridView Menu
const skyblue = Color.fromRGBO(12, 131, 218, 0.1);
const skyblue2 = Color.fromRGBO(0, 194, 255, 0.15);
const pink1 = Color.fromRGBO(255, 28, 246, 0.15);
const pink2 = Color.fromRGBO(255, 0, 92, 0.15);
const pink3 = Color.fromRGBO(255, 46, 46, 0.15);
const pink4 = Color.fromRGBO(189, 0, 255, 0.15);

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

// BOX STYLES

Gradient orangeGradient() {
  return LinearGradient(
    colors: [
      Color.fromRGBO(252, 207, 49, 1),
      Color.fromRGBO(245, 85, 85, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

Gradient greenGradient() {
  return LinearGradient(
    colors: [
      Color.fromRGBO(119, 211, 23, 1),
      Color.fromRGBO(4, 92, 25, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

Gradient purpleGradident() {
  return LinearGradient(
    colors: [primary, primary2],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

//box decoration with border colors only
BoxDecoration kGradientBoxDecoration(double radius, Gradient anyGradient) {
  return BoxDecoration(
      gradient: anyGradient,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      boxShadow: [
        BoxShadow(
          color: primary2.withOpacity(0.5),
          offset: Offset(0, 7),
          blurRadius: 7.0,
        ),
      ]);
}

BoxDecoration kGradientBoxDecoration2(double radius, Gradient anyGradient) {
  return BoxDecoration(
    gradient: anyGradient,
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

BoxDecoration k3DboxDecoration(
  double radius,
) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    boxShadow: [
      // BoxShadow(
      //   color: textColor,
      //   offset: Offset(0, 3),
      // ),
      // BoxShadow(
      //   color: white.withOpacity(0.95),
      //   // spreadRadius: -2.0,
      //   blurRadius: 7.0,
      // ),
      BoxShadow(
        color: textColor,
        offset: Offset(0, 0),
      ),
      BoxShadow(
        color: white,
        // spreadRadius: -4.0,
        blurRadius: 10.0,
        offset: Offset(0, -7),
      ),
    ],
  );
}

BoxDecoration k3DboxDecorationWithColor(
  double radius,
  Color color,
) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
    boxShadow: [
      BoxShadow(
        color: textColor,
        offset: Offset(0, 0),
      ),
      BoxShadow(
        color: white,
        // spreadRadius: -4.0,
        blurRadius: 10.0,
        offset: Offset(0, -7),
      ),
    ],
  );
}

BoxDecoration kOutlineBoxDecoration(double width, Color color, double radius) {
  return BoxDecoration(
    border: Border.all(width: width, color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

//box decoration with fill box colors
BoxDecoration kFillBoxDecoration(double width, Color color, double radius) {
  return BoxDecoration(
    color: color,
    border: Border.all(width: width, color: Colors.grey.shade300),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalySpace(double width) {
  return SizedBox(width: width);
}

// TEXT STYLES

TextStyle kBodyText12wBold(Color color) {
  return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold);
}

TextStyle kBodyText10wBold(Color color) {
  return TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold);
}

TextStyle kBodyText12wNormal(Color color) {
  return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.normal);
}

TextStyle kBodyText10wNormal(Color color) {
  return TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.normal);
}

TextStyle kBodyText14wBold(Color color) {
  return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.bold);
}

TextStyle kBodyText14wNormal(Color color) {
  return TextStyle(
      height: 1.2, color: color, fontSize: 14, fontWeight: FontWeight.normal);
}

TextStyle kBodyText14w500(Color color) {
  return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500);
}

TextStyle kBodyText14w500withoutSizer(Color color) {
  return TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w500);
}

TextStyle kBodyText15wNormal(Color color) {
  return TextStyle(color: color, fontSize: 15, fontWeight: FontWeight.normal);
}

TextStyle kBodyText16wBold(Color color) {
  return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w700);
}

TextStyle kBodyText18w500(Color color) {
  return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w500);
}

TextStyle kbodyText16w500(Color color) {
  return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500);
}

TextStyle kBodyText16wNormal(Color color) {
  return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.normal);
}

TextStyle kBodyText18wBold(Color color) {
  return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600);
}

TextStyle kBodyText18wNormal(Color color) {
  return TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.normal);
}

TextStyle kbodyText18W600(Color color) {
  return TextStyle(
      height: 1.3, color: color, fontSize: 18, fontWeight: FontWeight.w600);
}

TextStyle kBodyText20wBold(Color color) {
  return TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w600);
}

TextStyle kBodyText20wNormal(Color color) {
  return TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.normal);
}

TextStyle kBodyText24wBold(Color color) {
  return TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold);
}

TextStyle kBodyText24wNormal(Color color) {
  return TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.normal);
}

TextStyle kBodyText22wNormal(Color color) {
  return TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.w500);
}

TextStyle kBodyText22bold(Color color) {
  return TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold);
}

TextStyle kBodyText26wNormal(Color color) {
  return TextStyle(color: color, fontSize: 26, fontWeight: FontWeight.w500);
}

TextStyle kBodyText25Bold(Color color) {
  return TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold);
}

TextStyle kBodyText27wBold(Color color) {
  return TextStyle(color: color, fontSize: 27, fontWeight: FontWeight.bold);
}

TextStyle kBodyText40wBold(Color color) {
  return TextStyle(color: color, fontSize: 40, fontWeight: FontWeight.bold);
}

TextStyle kBodyText36wBold(Color color) {
  return TextStyle(color: color, fontSize: 36, fontWeight: FontWeight.bold);
}

TextStyle kBodyText35wBold(Color color) {
  return TextStyle(color: color, fontSize: 35, fontWeight: FontWeight.bold);
}

TextStyle kBodyText34wBold(Color color) {
  return TextStyle(color: color, fontSize: 34, fontWeight: FontWeight.bold);
}

TextStyle kBodyText32wBold(Color color) {
  return TextStyle(
      height: 1.2, color: color, fontSize: 32, fontWeight: FontWeight.w900);
}

TextStyle kBodyText30wBold(Color color) {
  return TextStyle(color: color, fontSize: 30, fontWeight: FontWeight.bold);
}

TextStyle kBodyText27wNormal(Color color) {
  return TextStyle(color: color, fontSize: 27, fontWeight: FontWeight.normal);
}

BoxDecoration kshadowDecoration(double radius, double blur) {
  return BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: blur,
            offset: Offset(0, 9)),
      ]);
}

// navigation//

nextScreen(BuildContext context, Widget screen) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}

replaceScreen(BuildContext context, Widget screen) {
  return Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}

goBack(BuildContext context) {
  return Navigator.pop(context);
}

snackbar(String text1, String text2) {
  Get.snackbar(text1, text2);
}

class Clipper extends CustomClipper<Rect> {
  final int part;

  Clipper({required this.part});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
        (size.width / 10) * part, 0.0, size.width, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}

Widget itemCard(
  BuildContext context,
  int bPrice,
  int aPrice,
  double rating,
  String imageAsset,
  String name,
  String area,
  String description,
  Size _screenSize,
) {
  return Container(
    width: 400,
    height: height(context) * 0.45,
    margin: const EdgeInsets.all(10),
    child: Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                InkWell(
                  onTap: () {
                    nextScreen(context, const HotelDetailPage());
                  },
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.fill,
                    height: 191,
                    width: width(context),
                  ),
                ),
                Positioned(
                  top: 5,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      // padding: const EdgeInsets.all(10),
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: pink,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            height: height(context) * 0.13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      name,
                      style: hotelName,
                    ),
                    Text(
                      area,
                      style: greyText,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                double size = _screenSize.height / 30;
                                double stars = 3.5;
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
                                  return Icon(Icons.star,
                                      color: grey, size: size);
                                }
                              }),
                            ),
                          ],
                        ),
                        Container(
                          // height: 20,
                          width: 40,
                          // padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                          decoration: BoxDecoration(
                            color: pink,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "$rating/5",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '₹ $bPrice',
                      style: GoogleFonts.lato(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '₹ $aPrice',
                      style: bodytext18Ww600,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "+ ₹ 594 taxes and fee",
                      style: blackNormalText,
                    ),
                    Text(
                      "Per Night",
                      style: greyText,
                    ),
                    addVerticalSpace(6),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget starBar(Size _screenSize, double rating) {
  return Row(
    children: [
      Wrap(
        children: List.generate(5, (index) {
          double size = _screenSize.height / 40;
          double stars = rating;
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
  );
}
