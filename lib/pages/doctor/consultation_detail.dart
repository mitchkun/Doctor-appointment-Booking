import 'package:lifespan/constant/constant.dart';
import 'package:lifespan/pages/screens.dart';
import 'package:lifespan/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ConsultationDetail extends StatefulWidget {
  final String name, doctorType, image, doctorExp, time, date;
  final double cost;

  const ConsultationDetail(
      {Key key,
      @required this.name,
      @required this.doctorType,
      @required this.image,
      @required this.doctorExp,
      @required this.time,
      @required this.date,
        @required this.cost})
      : super(key: key);

  @override
  _ConsultationDetailState createState() => _ConsultationDetailState();
}

class _ConsultationDetailState extends State<ConsultationDetail> {
  final patientList = [
    {'name': 'Ntsiki','surname': 'Sikhondze' , 'image': 'assets/user/user_3.jpg'},
    {'name': 'Siphamandla', 'surname': 'Msibi' ,'image': 'assets/user/user_2.jpg'}
  ];
  bool amazon = true,
      card = false,
      paypal = false,
      skrill = false,
      cashOn = false;
  String fname,lname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        elevation: 0.0,
        title: Text(
          'Consultation Detail',
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
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        width: double.infinity,
        height: 70.0,
        padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        alignment: Alignment.center,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    duration: Duration(milliseconds: 600),
                    child: Payment(
                      cost: widget.cost,
                        doctorName: widget.name,
                        time: widget.time,
                      date: widget.date,
                      clientFirstname_str: fname,
                      clientLastname_str: lname,




                    )));
          },
          child: Container(
            width: double.infinity,
            height: 50.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: primaryColor,
            ),
            child: Text(
              'Confirm & Pay',
              style: whiteColorButtonTextStyle,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 1.0,
            child: Container(
              color: whiteColor,
              padding:
                  EdgeInsets.only(top: fixPadding * 2.0, bottom: fixPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: widget.image,
                          child: Container(
                            width: 76.0,
                            height: 76.0,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(38.0),
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
                                image: AssetImage(widget.image),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${widget.name}',
                                      style: blackNormalBoldTextStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Wrap(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  duration: Duration(
                                                      milliseconds: 600),
                                                  type: PageTransitionType.fade,
                                                  child: DoctorProfile(
                                                    doctorImage:
                                                        widget.image,
                                                    doctorName:
                                                        widget.name,
                                                    doctorType:
                                                        widget.doctorType,
                                                    experience:
                                                        widget.doctorExp,
                                                  )));
                                        },
                                        child: Text(
                                          'View Profile',
                                          style: primaryColorsmallBoldTextStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                widget.doctorType,
                                style: greyNormalTextStyle,
                              ),
                              SizedBox(height: 7.0),
                              Text(
                                '${widget.doctorExp} Years Experience',
                                style: primaryColorNormalTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  heightSpace,
                  Container(
                    width: double.infinity,
                    height: 0.7,
                    color: greyColor.withOpacity(0.4),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: fixPadding,
                        right: fixPadding * 2.0,
                        left: fixPadding * 2.0),
                    margin: EdgeInsets.only(
                        right: fixPadding * 2.0,
                        left: fixPadding * 2.0,
                        top: fixPadding * 2.0),
                    //padding: EdgeInsets.all(fixPadding * 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 18.0,
                              color: greyColor,
                            ),
                            widthSpace,
                            Text(
                              widget.date,
                              style: blackNormalTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 18.0,
                              color: greyColor,
                            ),
                            widthSpace,
                            Text(
                              widget.time,
                              style: blackNormalTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(

              children: [
              Text(
              'Appointment for?',
              style: blackBigBoldTextStyle,
                textAlign: TextAlign.justify,
            ),

                for (var i in patientList) getPaymentTile(i['name'] + ' ' + i['surname'] ,i['image'],i),
                //appointmentFor(),
                //},
                Container(height: fixPadding * 2.0),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 25.0,
                color: primaryColor,
              ),
              widthSpace,
              Wrap(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(
                                  milliseconds: 600),
                              type: PageTransitionType.fade,
                              child: AddClient()));
                    },
                    child: Text(
                      'Add Patient',
                      style: primaryColorNormalBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  getPaymentTile(String title, String imgPath, var i) {
    return InkWell(
      onTap: () {
        //i.putIfAbsent('isSet', () => 'true');
        if (title == 'Ntsiki Sikhondze') {
          setState(() {
            cashOn = true;
            amazon = false;
            fname ="Ntsiki";
            lname = "Sikhondze";
          });
        } else if (title == 'Siphamandla Msibi') {
          setState(() {
            cashOn = false;
            amazon = true;
            fname ="Siphamandla";
            lname = "Msibi";
          });
        }
      },
      child: Container(
        margin: EdgeInsets.only(
            right: fixPadding * 2.0,
            left: fixPadding * 2.0,
            top: fixPadding * 2.0),
        padding: EdgeInsets.all(fixPadding * 2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            width: 1.0,
            color:(title == 'Ntsiki Sikhondze')
                ? (cashOn) ? primaryColor : Colors.grey[300]
                : (title == 'Siphamandla Msibi')
                ? (amazon) ? primaryColor : Colors.grey[300]
                : (skrill) ? primaryColor : Colors.grey[300],
          ),
          color: whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  child:
                  Image.asset(imgPath, width: 50.0, fit: BoxFit.fitWidth),
                ),
                widthSpace,
                Text(title, style: primaryColorHeadingTextStyle),
              ],
            ),
            Container(
              width: 20.0,
              height: 20.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                   border: Border.all(
                  width: 1.5,
                  color: (title == 'Ntsiki Sikhondze')
                      ? (cashOn) ? primaryColor : Colors.grey[300]
                      : (title == 'Siphamandla Msibi')
                      ? (amazon) ? primaryColor : Colors.grey[300]
                      : (skrill) ? primaryColor : Colors.grey[300],
                ),
              ),
              child: Container(
                width: 10.0,
                height: 10.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: (title == 'Ntsiki Sikhondze')
                      ? (cashOn) ? primaryColor : Colors.transparent
                      : (title == 'Siphamandla Msibi')
                      ? (amazon) ? primaryColor : Colors.transparent
                      : (skrill) ? primaryColor : Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  appointmentFor() {
    return Container(
      padding: EdgeInsets.all(fixPadding * 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Appointment for?',
            style: blackBigBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          ColumnBuilder(
            itemCount: patientList.length,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            itemBuilder: (context, index) {
              final item = patientList[index];
              return Container(
                margin: (index == 0)
                    ? EdgeInsets.only(top: 0.0)
                    : EdgeInsets.only(top: fixPadding * 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (item['image'] != '')
                        ? Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(35.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  color: Colors.grey[300],
                                ),
                              ],
                              image: DecorationImage(
                                  image: AssetImage(item['image']),
                                  fit: BoxFit.cover),
                            ),
                          )
                        : Container(
                            width: 70.0,
                            height: 70.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(35.0),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  color: Colors.grey[300],
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.person,
                              size: 30.0,
                              color: greyColor,
                            ),
                          ),
                    widthSpace,
                    widthSpace,
                    Expanded(
                      child: Text(
                        item['name'],
                        style: blackNormalBoldTextStyle,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 25.0,
                color: primaryColor,
              ),
              widthSpace,
              Text(
                'Add Patient',
                style: primaryColorNormalBoldTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
