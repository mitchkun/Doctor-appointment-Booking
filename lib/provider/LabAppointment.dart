import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lifespan/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LabAppointment with ChangeNotifier {
  String id;
  String email;
  String password;

  String get getUserId => id;

  String get getUserName => email;

  String get getUserPassword => password;

  User parseUser(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json));
  }

  Future<int> setAppointment(  String systemBranchStr,
      String appointDateDat,
      String appointTimeTm,
  String clientLastnameStr,
  String clientFirstnameStr,
  String postedByGUID) async {
    final response = await http.post(Uri.parse("http://104.236.229.139:6000/user/booking"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'branch': systemBranchStr,
      'app_date': appointDateDat,
      'app_time': appointTimeTm,
      'client_lname': clientLastnameStr,
      'client_fname': clientFirstnameStr,
      'postedby_GUID': postedByGUID
    });

    print(response.body);

      return response.statusCode;

  }
  Future<bool> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  Future<String> getFirstName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("firstName");
  }
  Future<bool> setFirstName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("firstName",value);
  }

  // Future<int> signinUser(String email, String password) async {
  //   final response =
  //   await http.post(Uri.parse("http://104.236.229.139:6000/user/signin"), headers: {
  //     "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
  //   }, body: {
  //     'email': email,
  //     'password': password,
  //   });
  //
  //   //print(response.body);
  //
  //   if (response.statusCode == 200){
  //     Map<String,dynamic> map = jsonDecode(response.body);
  //
  //     // List<dynamic> values = new List<dynamic>();
  //     // values = json.decode(response.body);
  //     print('${map['userdata']}');
  //     User newUser = User.fromJson(map);
  //     print(newUser.firstname);
  //     setFirstName(newUser.firstname);
  //     setLastName(newUser.lastname);
  //     setOIDName(newUser.oid);
  //     setLoggedIn(true);
  //   }
  //
  //     return response.statusCode;
  //
  // }
}