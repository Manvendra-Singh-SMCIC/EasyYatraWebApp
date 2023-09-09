// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_hotel_management_webapp/globals/global.dart';
import 'package:flutter_hotel_management_webapp/model/hotel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_hotel_management_webapp/utils/constant.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:flutter_hotel_management_webapp/provider/page_rebuilder.dart';
import '../auth/auth_controller.dart';
import '../utilityWidgets/commonWidgets.dart';
import '../utilityWidgets/hostproperty.dart';
import '../utils/styles.dart';
import 'home.dart';
import 'login.dart';

class HotelSearchPage extends StatefulWidget {
  const HotelSearchPage({super.key});

  @override
  State<HotelSearchPage> createState() => _HotelSearchPageState();
}

class _HotelSearchPageState extends State<HotelSearchPage> {
  Color _primaryColor = Color(0xFFE1F3FF);
  final List<String> _filterByList = [
    "BreakFast",
    "Free AirPort Shuttle",
    "BreakFast",
    "BreakFast",
    "BreakFast",
    "BreakFast",
  ];

  final List<String> _SortByList = [
    "High to low",
    "Low to high",
    "High customer ratings",
    "New",
    "Old",
  ];

  final List<String> _propertyClassList = [
    "1 Star",
    "2 Star",
    "3 Star",
    "4 Star",
    "5 Star",
  ];

  List<bool> filter = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> sort = [
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> propertyClass = [
    false,
    false,
    false,
    false,
    false,
  ];

  String selectType = "Latest";
  int selectedType = 1;

  TextEditingController cityController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

  final ScrollController _scrollController = ScrollController();
  List<int> itemList =
      List<int>.generate(10, (index) => index); // Initial list with 10 items
  bool isLoading = false;
  int loadedItemCount = 10;
  final int totalItemCount = 1000; // Total number of items to load

  @override
  void initState() {
    cityController.text = Global.city;
    dateStart.text = DateFormat("dd MMM yyyy")
        .format((Global.selectedDateRange ?? Global.initialDateRange).start);
    dateEnd.text = DateFormat("dd MMM yyyy")
        .format((Global.selectedDateRange ?? Global.initialDateRange).end);
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Reach the bottom of the list, load more items
      loadMoreItems();
    }
  }

  void loadMoreItems() {
    if (!isLoading && loadedItemCount < totalItemCount) {
      setState(() {
        isLoading = true;
      });

      // Simulate loading delay
      Future.delayed(Duration(seconds: 2), () {
        int itemsToLoad = 10;
        if (loadedItemCount + itemsToLoad > totalItemCount) {
          itemsToLoad = totalItemCount - loadedItemCount;
        }

        List<int> newItems =
            List<int>.generate(itemsToLoad, (index) => itemList.length + index);
        setState(() {
          itemList.addAll(newItems);
          loadedItemCount += itemsToLoad;
          isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageRebuilder = Provider.of<PageRebuilder>(context);
    String count1 = Global.RoomData[0].toString();
    String count2 = Global.RoomData[1].toString();
    String count3 = Global.RoomData[2].toString();
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            _screenSize.width * 0.05,
            _screenSize.height * 0.01,
            _screenSize.width * 0.05,
            _screenSize.height * 0.01),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _titleBar(_screenSize),
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
                                          .format(
                                              Global.initialDateRange.start),
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
                              await showSelectGuestAndRooms(
                                  context, pageRebuilder);
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
              _locationRoute(_screenSize),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: _screenSize.width * 0.22,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _searchSection(_screenSize),
                            Container(
                              // height: _screenSize.height * 0.47,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: _screenSize.height * 0.02,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: _screenSize.width * 0.006),
                                          child: Text(
                                            'Filter By',
                                            style: TextStyle(
                                              fontFamily: 'Satoshi Variable',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 1.4210526315789473,
                                              // letterSpacing: -0.40799999237060547,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: _screenSize.height * 0.01),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: List.generate(
                                              _filterByList.length, (index) {
                                            return Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 5),
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    onChanged: (e) {
                                                      setState(() {
                                                        filter[index] = e!;
                                                      });
                                                    },
                                                    value: filter[index],
                                                  ),
                                                  Text(
                                                    _filterByList[index],
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Satoshi Variable',
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.333333333, // To convert line-height (32px) to height
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: _screenSize.height * 0.02,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: _screenSize.width * 0.006),
                                          child: Text(
                                            'Sort By',
                                            style: TextStyle(
                                              fontFamily: 'Satoshi Variable',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              height: 1.4210526315789473,
                                              // letterSpacing: -0.40799999237060547,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height: _screenSize.height * 0.01),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: List.generate(
                                              _SortByList.length, (index) {
                                            return Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 5),
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    onChanged: (e) {
                                                      setState(() {
                                                        sort.fillRange(0,
                                                            sort.length, false);
                                                        sort[index] = e!;
                                                      });
                                                    },
                                                    value: sort[index],
                                                  ),
                                                  Text(
                                                    _SortByList[index],
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Satoshi Variable',
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.333333333333, // To convert line-height (32px) to height
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: _screenSize.height * 0.02,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: _screenSize.width * 0.006),
                                          child: Text('Property Class',
                                              style: TextStyle(
                                                fontFamily: 'Satoshi Variable',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                height: 1.4210526315789473,
                                                // letterSpacing: -0.40799999237060547,
                                              )),
                                        ),
                                        SizedBox(
                                            height: _screenSize.height * 0.01),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: List.generate(
                                              _propertyClassList.length,
                                              (index) {
                                            return Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 5),
                                              child: Row(
                                                children: [
                                                  Checkbox(
                                                    onChanged: (e) {
                                                      setState(() {
                                                        propertyClass[index] =
                                                            e!;
                                                      });
                                                    },
                                                    value: propertyClass[index],
                                                  ),
                                                  Text(
                                                    _propertyClassList[index],
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'Satoshi Variable',
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.3333333333, // To convert line-height (32px) to height
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _screenSize.width * 0.68,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: _screenSize.width * 0.68,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            _screenSize.width * 0.02, 0, 0, 0),
                                        child: Text("234 Properties",
                                            style: TextStyle(
                                              fontFamily: 'Satoshi Variable',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              height: 49 /
                                                  36, // Line height calculated by dividing line height by font size
                                              letterSpacing: -0.408,
                                            )),
                                      ),
                                      Container(
                                        width: _screenSize.width * 0.3,
                                        child: DropdownButton(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          value: selectedType,

                                          items: [
                                            DropdownMenuItem(
                                              value: 1,
                                              onTap: () {
                                                setState(() {
                                                  selectedType = 1;
                                                });
                                              },
                                              child: const Text(
                                                "    Latest",
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Satoshi Variable',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w400,
                                                  height: 49 /
                                                      36, // Line height calculated by dividing line height by font size
                                                  letterSpacing: -0.408,
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem(
                                              value: 2,
                                              onTap: () {
                                                setState(() {
                                                  selectedType = 2;
                                                });
                                              },
                                              child: const Text(
                                                "    Recommended",
                                                style: TextStyle(
                                                  fontFamily:
                                                      'Satoshi Variable',
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w400,
                                                  height: 49 /
                                                      36, // Line height calculated by dividing line height by font size
                                                  letterSpacing: -0.408,
                                                ),
                                              ),
                                            ),
                                          ],
                                          onChanged: (e) {
                                            setState(() {
                                              selectedType =
                                                  int.parse(e.toString());
                                              print(selectedType);
                                            });
                                          },
                                          underline: Container(),
                                          isExpanded: true,
                                          // padding: EdgeInsets.only(
                                          //     left: _screenSize.width * 0.02,
                                          //     right: _screenSize.width * 0.02),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _screenSize.height * 0.05,
                            ),
                            Container(
                              // height: _screenSize.height * 0.45,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    _screenSize.width * 0.03,
                                    0,
                                    _screenSize.width * 0.03,
                                    0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      controller: _scrollController,
                                      itemCount:
                                          itemList.length + (isLoading ? 1 : 0),
                                      itemBuilder: (context, index) {
                                        if (index < itemList.length) {
                                          return _hotelDetail(
                                            Hotel(
                                              id: 1,
                                              name: "Grand Hotel",
                                              place: "New York",
                                              rating: 4.5,
                                              popularamenities:
                                                  "Swimming pool, Gym, Spa",
                                              hotelimages: "3.jpg",
                                              availableroomtype: [
                                                "Single",
                                                "Double",
                                                "Suite"
                                              ],
                                              description: Global.hotelDesc,
                                              cancellationpolicy:
                                                  "Free cancellation up to 24 hours before check-in.",
                                              rulesandregulations:
                                                  "No smoking, No pets allowed.",
                                              reviews: [
                                                {
                                                  "user": "John",
                                                  "rating": 4.8,
                                                  "comment":
                                                      "Great hotel with excellent service."
                                                },
                                                {
                                                  "user": "Sarah",
                                                  "rating": 4.2,
                                                  "comment":
                                                      "Comfortable rooms and friendly staff."
                                                }
                                              ],
                                              cost: 7847,
                                            ),
                                            _screenSize,
                                          );
                                        } else if (isLoading) {
                                          return Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          // Reached the end of the list
                                          return Container();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              _pageFooter(_screenSize),
            ],
          ),
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

  InkWell _hotelDetail(Hotel hotel, Size _screenSize) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/detail');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2), // Shadow offset in x and y direction
                  blurRadius: 4, // Spread radius of the shadow
                  spreadRadius: 0, // Additional spreading of the shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: _screenSize.width * 0.65,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: _screenSize.height * 0.4,
                          width: _screenSize.width * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://images.unsplash.com/photo-1571896349842-33c89424de2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: _screenSize.width * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Container(
                            width: _screenSize.width * 0.3,
                            child: _hotelData(hotel, _screenSize),
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Starting from',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Satoshi Variable',
                            fontSize: _screenSize.width * 0.012,
                            fontWeight: FontWeight.w700,
                            height: 32 /
                                24, // Line height calculated by dividing line height by font size
                            letterSpacing: -0.408,
                          )),
                      Text('₹ 4,433',
                          style: TextStyle(
                            fontFamily: 'Satoshi Variable',
                            fontSize: _screenSize.width * 0.012,
                            fontWeight: FontWeight.w500,
                            height: 32 /
                                24, // Line height calculated by dividing line height by font size
                            letterSpacing: -0.802,
                          )),
                      Text('₹ 3,493',
                          style: TextStyle(
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
                            fontFamily: 'Satoshi Variable',
                            fontSize: _screenSize.width * 0.01,
                            fontWeight: FontWeight.w500,
                            height: 27 /
                                20, // Line height calculated by dividing line height by font size
                            letterSpacing: -0.802,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: _screenSize.height * 0.05,
          )
        ],
      ),
    );
  }

  Column _hotelData(Hotel hotel, Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          hotel.name,
          style: TextStyle(
            fontFamily: 'Satoshi Variable',
            fontSize: _screenSize.width * 0.02,
            fontWeight: FontWeight.w700,
            height: 43 /
                32, // Line height calculated by dividing line height by font size
            letterSpacing: -0.408,
          ),
        ),
        Text(hotel.place,
            style: TextStyle(
              fontFamily: 'Satoshi Variable',
              fontSize: _screenSize.width * 0.013,
              fontWeight: FontWeight.w400,
              height: 32 /
                  24, // Line height calculated by dividing line height by font size
              letterSpacing: -0.408,
            )),
        Container(
          // width: _screenSize.width * 0.23,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              starBar(_screenSize, 3.3),
              SizedBox(
                width: _screenSize.width * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFFDA4167),
                ),
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                child: Text("${hotel.rating}/5",
                    style: TextStyle(
                        fontFamily: 'Satoshi Variable',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 24 /
                            18, // Line height calculated by dividing line height by font size
                        letterSpacing: -0.903,
                        color: Colors.white)),
              ),
              SizedBox(
                width: _screenSize.width * 0.008,
              ),
              Text("Guest ratings",
                  style: TextStyle(
                    fontFamily: 'Satoshi Variable',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 24 /
                        18, // Line height calculated by dividing line height by font size
                    letterSpacing: -0.903,
                  ))
            ],
          ),
        ),
        Container(
          // width: _screenSize.width * 0.4,
          child: AutoSizeText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
            maxFontSize: 20,
            style: TextStyle(
              fontSize: _screenSize.width * 0.012,
            ),
          ),
        ),
      ],
    );
  }

  Column _searchSection(Size _screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Search Property by name',
              style: TextStyle(
                fontFamily: 'Satoshi Variable',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height:
                    1.4210526315789473, // To convert line-height (38px) to height
                letterSpacing:
                    -0.408, // Letter spacing in Flutter uses logical pixels
              ),
            ),
            SizedBox(
              height: _screenSize.height * 0.01,
            ),
            Container(
              width: _screenSize.width * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue, width: 0.5)),
              child: TextField(
                cursorHeight: 20,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5)),
              ),
            )
          ],
        ),
        SizedBox(
          height: _screenSize.height * 0.035,
        ),
        Container(
          width: _screenSize.width * 0.25,
          child: Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Column __dropDown(Size _screenSize, int selectedType) {
    return Column(
      children: [
        Container(
          width: _screenSize.width * 0.68,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_screenSize.width * 0.02, 0, 0, 0),
                child: Text("234 Properties",
                    style: TextStyle(
                      fontFamily: 'Satoshi Variable',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 49 /
                          36, // Line height calculated by dividing line height by font size
                      letterSpacing: -0.408,
                    )),
              ),
              Container(
                width: _screenSize.width * 0.3,
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20),
                  value: selectedType,

                  items: [
                    DropdownMenuItem(
                      value: 1,
                      onTap: () {
                        setState(() {
                          selectedType = 1;
                        });
                      },
                      child: const Text(
                        "    Latest",
                        style: TextStyle(
                          fontFamily: 'Satoshi Variable',
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          height: 49 /
                              36, // Line height calculated by dividing line height by font size
                          letterSpacing: -0.408,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      onTap: () {
                        setState(() {
                          selectedType = 2;
                        });
                      },
                      child: const Text(
                        "    Recommended",
                        style: TextStyle(
                          fontFamily: 'Satoshi Variable',
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          height: 49 /
                              36, // Line height calculated by dividing line height by font size
                          letterSpacing: -0.408,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (e) {
                    setState(() {
                      selectedType = int.parse(e.toString());
                      print(selectedType);
                    });
                  },
                  underline: Container(),
                  isExpanded: true,
                  // padding: EdgeInsets.only(
                  //     left: _screenSize.width * 0.02,
                  //     right: _screenSize.width * 0.02),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Column _locationRoute(Size _screenSize) {
    return Column(
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
        SizedBox(
          height: _screenSize.height * 0.03,
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
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: Image.asset('/images/Easyatra.png'),
                ),
                Container(
                  width: _screenSize.width * 0.3,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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

Future<dynamic> showSelectGuestAndRooms(
    BuildContext context, PageRebuilder pageRebuilder) {
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
                    pageRebuilder.rebuildPage();
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
