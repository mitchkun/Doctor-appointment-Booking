import 'package:lifespan/constant/constant.dart';
import 'package:lifespan/pages/screens.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DoctorList extends StatefulWidget {
  final String doctorType;

  const DoctorList({Key key, @required this.doctorType}) : super(key: key);

  @override
  _DoctorListState createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  final doctorList = [
    {
      'name': 'Manzini Branch',
      'image': 'assets/doctor/doctor-1.png',
      'exp': '8',
      'rating': '4.9',
      'review': '135'
    },
   {
      'name': 'Mbabane Branch',
      'image': 'assets/doctor/doctor-4.png',
      'exp': '5',
      'rating': '5.0',
      'review': '50'
    }
    // {
    //   'name': 'Lily Fakudze',
    //   'image': 'assets/doctor/doctor-5.png',
    //   'exp': '15',
    //   'rating': '4.9',
    //   'review': '512'
    // },
    // {
    //   'name': 'Sethu Sikhondze',
    //   'image': 'assets/doctor/doctor-8.png',
    //   'exp': '2',
    //   'rating': '4.5',
    //   'review': '9'
    // }
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: widget.doctorType,
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          titleSpacing: 0.0,
          elevation: 0.0,
          title: Text(
            widget.doctorType,
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
                    hintText: 'Search ${widget.doctorType}',
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
        body: ListView.builder(
          itemCount: doctorList.length,
          itemBuilder: (context, index) {
            final item = doctorList[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(50.0),
                              border:
                                  Border.all(width: 0.3, color: primaryColor),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  color: Colors.grey[300],
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(item['image']),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          widthSpace,
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${item['name']}',
                                  style: blackNormalBoldTextStyle,
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  widget.doctorType,
                                  style: greyNormalTextStyle,
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  '${item['exp']} Years Experience',
                                  style: primaryColorNormalTextStyle,
                                ),
                                SizedBox(height: 7.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.lime, size: 20.0),
                                    SizedBox(width: 5.0),
                                    Text(
                                      item['rating'],
                                      style: blackNormalTextStyle,
                                    ),
                                    widthSpace,
                                    widthSpace,
                                    Icon(Icons.rate_review,
                                        color: Colors.grey, size: 20.0),
                                    SizedBox(width: 5.0),
                                    Text(
                                      '${item['review']} Reviews',
                                      style: blackNormalTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  duration: Duration(milliseconds: 600),
                                  type: PageTransitionType.fade,
                                  child: DoctorTimeSlot(
                                    doctorImage: item['image'],
                                    doctorName: item['name'],
                                    doctorType: widget.doctorType,
                                    experience: item['exp'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: (width - fixPadding * 6 + 1.4) / 2.0,
                              padding: EdgeInsets.all(fixPadding),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.07),
                                borderRadius: BorderRadius.circular(8.0),
                                border:
                                    Border.all(width: 0.7, color: primaryColor),
                              ),
                              child: Text(
                                'Book Appointment',
                                style: primaryColorsmallBoldTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                divider(),
              ],
            );
          },
        ),
      ),
    );
  }

  divider() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      height: 0.8,
      color: greyColor.withOpacity(0.3),
    );
  }
}
