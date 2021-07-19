import 'package:lifespan/constant/constant.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        elevation: 1.0,
        title: Text(
          'About Us',
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0,
            ),
            child: Text(
              'Lifespan Diagnostics is a fully automated pathology and diagnostics laboratory that offers timely, affordable and quality test results. Our diagnostics services are differentiated to meet the needs of doctors, patients through accessible, reliable and innovative products. We adhere to the same strict policies and procedures to make sure our clients needs are met.',
              style: blackNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0,
            ),
            child: Text(
              'Our mission is to deliver a safe and effective service of accuracy and quality results by employing strict standard operating procedures and adhering to all health laboratory standards.',
              style: blackNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: fixPadding * 2.0,
              right: fixPadding * 2.0,
              left: fixPadding * 2.0,
            ),
            child: Text(
              'ISO Certified : To continually improve the quality of our service, our lab observes quality management systems and follows ISO 15189 guidelines which is requirements for quality and competence and 15190 which is medical laboratories requirements for safety.',
              style: blackNormalTextStyle,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
