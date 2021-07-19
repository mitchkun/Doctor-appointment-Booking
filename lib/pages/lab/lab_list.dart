import 'package:flutter/material.dart';
import 'package:lifespan/constant/constant.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lifespan/pages/screens.dart';

class LabList extends StatefulWidget {
  @override
  _LabListState createState() => _LabListState();
}

class _LabListState extends State<LabList> {
  final labList = [
    {
      'name': 'Manzini Headquarters',
      'image': 'assets/lab/lab_1.jpg',
      'address': 'Shop #6, Philani Building, Plot 18, Ternbergen Street',
      'phone': '+268 76061872',
      'lat': 40.7392475,
      'lang': -73.9795667
    },
    {
      'name': 'Mbabane Branch',
      'image': 'assets/lab/lab_2.jpg',
      'address': 'Office #202, Development House, Swazi Plaza, Mbabane',
      'phone': '+268 2404 1009',
      'lat': 40.7760308,
      'lang': -73.978491
    },
    {
      'name': 'Nhlangano Branch',
      'image': 'assets/lab/lab_3.jpg',
      'address': 'Shop #2, Busy Street, Tea Rd, Nhlangano',
      'phone': '+268 76061872',
      'lat': 40.7446378,
      'lang': -73.989919
    }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        elevation: 0.0,
        title: Text(
          'Our Locations',
          style: appBarTitleTextStyle,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: blackColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Container(
            color: whiteColor,
            height: 65.0,
            padding: EdgeInsets.only(
              left: fixPadding * 2.0,
              right: fixPadding * 2.0,
              top: fixPadding,
              bottom: fixPadding,
            ),
            alignment: Alignment.center,
            child: Container(
              height: 55.0,
              padding: EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8.0),
                border:
                    Border.all(width: 1.0, color: greyColor.withOpacity(0.6)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Lab',
                  hintStyle: greyNormalTextStyle,
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      top: fixPadding * 0.78, bottom: fixPadding * 0.78),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        child: ListView.builder(
          itemCount: labList.length,
          itemBuilder: (context, index) {
            final item = labList[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 600),
                        type: PageTransitionType.rightToLeft,
                        child: Lab(
                          name: item['name'],
                          address: item['address'],
                          phone: item['phone'],
                          image: item['image'],
                          lat: item['lat'],
                          lang: item['lang'],
                        )));
              },
              child: Container(
                margin: (index != labList.length - 1)
                    ? EdgeInsets.only(
                        top: fixPadding * 2.0,
                        right: 3.0,
                        left: 3.0,
                      )
                    : EdgeInsets.only(
                        top: fixPadding * 2.0,
                        bottom: fixPadding * 2.0,
                        right: 3.0,
                        left: 3.0,
                      ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 180.0,
                      width: width / 3.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10.0)),
                        image: DecorationImage(
                          image: AssetImage(item['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(fixPadding),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: blackNormalBoldTextStyle,
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              item['address'],
                              style: greySmallBoldTextStyle,
                            ),
                            heightSpace,
                            Container(
                              padding: EdgeInsets.all(fixPadding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(width: 0.7, color: primaryColor),
                              ),
                              child: Text(
                                'Call now',
                                style: primaryColorsmallBoldTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 165.0,
                      width: 30.0,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18.0,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
