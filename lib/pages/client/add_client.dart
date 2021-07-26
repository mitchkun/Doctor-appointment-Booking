import 'package:lifespan/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lifespan/pages/screens.dart';
import 'package:provider/provider.dart';
import '../../provider/Auth_Provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddClient extends StatefulWidget {
  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  String email,
      firstname,
      lastname,
      othername,
      phone,
      nationalid,
      passport,
      birthdate,
      gender,
      physical,
      postal,
      status;
  Auth_Provider authProvider;

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of(context, listen: false);
    return Hero(
      tag: 'Register Patient',
      child: Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          titleSpacing: 0.0,
          elevation: 0.0,
          title: Text(
            'Register Patient',
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
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'First Name',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    firstname = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Other Name',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    othername = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Last Name',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    lastname = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Email',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (val) {
                    email = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Phone',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.phone,
                  onChanged: (val) {
                    phone = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'National ID',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    nationalid = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Passport No',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    passport = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Birth Date',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.datetime,
                  onChanged: (val) {
                    birthdate = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Gender',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    gender = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Residential Address',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    physical = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Postal Address',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    postal = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200].withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: TextField(
                  style: inputLoginTextStyle,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20.0),
                    hintText: 'Marital Status',
                    hintStyle: inputLoginTextStyle,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  onChanged: (val) {
                    status = val;
                  },
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0, left: 20.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30.0),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  if (await authProvider.addPatient(
                          email,
                          firstname,
                          lastname,
                          othername,
                          phone,
                          nationalid,
                          passport,
                          birthdate,
                          gender,
                          physical,
                          postal,
                          status,
                          prefs.getString('firstName') +
                              ", " +
                              prefs.getString('lastName'),
                          prefs.getString('oid')) ==
                      201) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Patient added"),
                    ));
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: Duration(milliseconds: 600),
                            type: PageTransitionType.fade,
                            child: BottomBar()));
                  } else if (await authProvider.addPatient(
                          email,
                          firstname,
                          lastname,
                          othername,
                          phone,
                          nationalid,
                          passport,
                          birthdate,
                          gender,
                          physical,
                          postal,
                          status,
                          prefs.getString('firstName') +
                              ", " +
                              prefs.getString('lastName'),
                          prefs.getString('oid')) ==
                      404) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Patient Exists"),
                    ));
                  } else if (await authProvider.addPatient(
                          email,
                          firstname,
                          lastname,
                          othername,
                          phone,
                          nationalid,
                          passport,
                          birthdate,
                          gender,
                          physical,
                          postal,
                          status,
                          prefs.getString('firstName') +
                              ", " +
                              prefs.getString('lastName'),
                          prefs.getString('oid')) ==
                      500) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Server Error"),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Network Error"),
                    ));
                  }
                },
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.5, 0.9],
                      colors: [
                        Colors.blue[300].withOpacity(0.8),
                        Colors.blue[500].withOpacity(0.8),
                        Colors.blue[800].withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Text(
                    'Add Patient',
                    style: inputLoginTextStyle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
