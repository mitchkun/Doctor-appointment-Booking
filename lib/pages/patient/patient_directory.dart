import 'package:lifespan/constant/constant.dart';
import 'package:lifespan/pages/client/add_client.dart';
import 'package:lifespan/provider/Auth_Provider.dart';
import 'package:lifespan/widget/column_builder.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientDirectory extends StatefulWidget {
  @override
  _PatientDirectoryState createState() => _PatientDirectoryState();
}

class _PatientDirectoryState extends State<PatientDirectory> {
  Auth_Provider authProvider;
  SharedPreferences prefs;
  List<dynamic> patientList = [];

  _PatientDirectoryState() {
    getPatienList().then((val) => setState(() {
          patientList = val;
        }));
  }

  Future<List<dynamic>> getPatienList() async {
    prefs = await SharedPreferences.getInstance();
    return authProvider.getPatient(prefs.getString("oid"));
  }

  deletePatientDialog(index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return Dialog(
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Are you sure you want to delete this client?",
                      style: blackNormalTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'No',
                              style: primaryColorButtonTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            if (await authProvider.deletePatient(
                                    patientList[index]["OID"],
                                    prefs.getString('firstName') +
                                        ' ' +
                                        prefs.getString('lastName')) ==
                                200) {
                              setState(() {
                                patientList.removeAt(index);
                              });
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  // return object of type Dialog
                                  return Dialog(
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Container(
                                      height: 170.0,
                                      padding: EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                                         child: Container(
                                            height: 70.0,
                                            width: 70.0,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.0),
                                              border: Border.all(
                                                  color: primaryColor,
                                                  width: 1.0),
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              size: 40.0,
                                              color: primaryColor,
                                            ),
                                          ),
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            "Success!",
                                            style: greySmallBoldTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            width: (MediaQuery.of(context).size.width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Yes',
                              style: whiteColorButtonTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of(context, listen: false);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        titleSpacing: 0.0,
        elevation: 1.0,
        title: Text(
          'Patient Directory',
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  duration: Duration(milliseconds: 600),
                  type: PageTransitionType.fade,
                  child: AddClient()));
        },
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: ColumnBuilder(
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
                      (item['firstName_str'] != '')
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
                                    image: AssetImage('assets/user/sick.png'),
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
                          '${item['firstName_str']} ${item['lastName_str']}',
                          style: blackNormalBoldTextStyle,
                        ),
                      ),
                      InkWell(
                        onTap: () => deletePatientDialog(index),
                        child: Icon(
                          Icons.close,
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
