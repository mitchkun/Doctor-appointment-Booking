import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lifespan/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth_Provider with ChangeNotifier {
  String id;
  String email;
  String password;
  static const url = "http://173.212.233.244:6000";

  String get getUserId => id;

  String get getUserName => email;

  String get getUserPassword => password;

  User parseUser(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json));
  }

  Future<int> signupUser(
      String email, String password, String firstName, String lastName) async {
    final response = await http.post(Uri.parse(url + "/user/signup"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'email_str': email,
      'password_str': password,
      'firstName_str': firstName,
      'lastName_str': lastName
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
    return prefs.setString("firstName", value);
  }

  Future<String> getLastName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lastName");
  }

  Future<bool> setLastName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("lastName", value);
  }

  Future<bool> getLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("loggedIn");
  }

  Future<bool> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("loggedIn", value);
  }

  Future<String> getOIDName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("oid");
  }

  Future<bool> setOIDName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("oid", value);
  }

  Future<String> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  Future<bool> setEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("email", value);
  }

  Future<int> signinUser(String email, String password) async {
    final response = await http.post(Uri.parse(url + "/user/signin"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      User newUser = User.fromJson(map);
      setFirstName(newUser.firstname);
      setLastName(newUser.lastname);
      setOIDName(newUser.oid);
      setLoggedIn(true);
    }

    return response.statusCode;
  }

  Future<List<dynamic>> getPastAppointment(String postedByGUID) async {
    List<dynamic> appointlist;
    final response =
        await http.post(Uri.parse(url + "/user/pastappointments"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'postedBy_GUID': postedByGUID,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      appointlist = map['userdata'];
    }

    return appointlist;
  }

  Future<int> cancelAppointment(String request_OID) async {
    final response =
        await http.post(Uri.parse(url + "/user/cancelappointments"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'request_OID': request_OID,
    });

    return response.statusCode;
  }

  Future<int> deletePatient(String OID, String deletedBY) async {
    final response =
        await http.post(Uri.parse(url + "/user/deletepatient"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'OID': OID,
      'deletedBy': deletedBY
    });

    return response.statusCode;
  }

  Future<List<dynamic>> getAppointment(String postedByGUID) async {
    List<dynamic> appointlist;
    final response =
        await http.post(Uri.parse(url + "/user/appointments"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'postedBy_GUID': postedByGUID,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      appointlist = map['userdata'];
    }

    return appointlist;
  }

  Future<List<dynamic>> getCancelledAppointment(String postedByGUID) async {
    List<dynamic> appointlist;
    final response = await http
        .post(Uri.parse(url + "/user/cancelledappointments"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'postedBy_GUID': postedByGUID,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      appointlist = map['userdata'];
    }

    return appointlist;
  }

  Future<int> setAppointment(
      String systemBranchStr,
      String appointDateDat,
      String appointTimeTm,
      String clientLastnameStr,
      String clientFirstnameStr,
      String postedByGUID) async {
    final response =
        await http.post(Uri.parse(url + "/user/booking"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'branch': systemBranchStr,
      'app_date': appointDateDat,
      'app_time': appointTimeTm,
      'client_lname': clientLastnameStr,
      'client_fname': clientFirstnameStr,
      'postedby_GUID': postedByGUID
    });

    return response.statusCode;
  }

  Future<int> addPatient(
      String email,
      String firstname,
      String lastname,
      String othername,
      String phone,
      String nationalid,
      String passport,
      String birthdate,
      String gender,
      String physical,
      String postal,
      String status,
      String addedUser,
      String postedByGUID) async {
    final response =
        await http.post(Uri.parse(url + "/user/addpatient"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'email_str': email,
      'otherName_str': othername,
      'firstName_str': firstname,
      'lastName_str': lastname,
      'nationalIdNumber_str': nationalid,
      'passportTravelNo_str': passport,
      'phoneNumber_str': phone,
      'birthDate_dat': birthdate,
      'gender_str': gender,
      'maritalStatus_str': status,
      'addressResidential_str': physical,
      'addressPostal_str': postal,
      'addedUser_str': addedUser,
      'postedby_GUID': postedByGUID
    });

    return response.statusCode;
  }

  Future<List<dynamic>> getPatient(String postedByGUID) async {
    List<dynamic> patientlist;
    final response =
        await http.post(Uri.parse(url + "/user/patients"), headers: {
      "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
    }, body: {
      'postedby_GUID': postedByGUID,
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);

      patientlist = map['userdata'];
    }

    return patientlist;
  }
}
