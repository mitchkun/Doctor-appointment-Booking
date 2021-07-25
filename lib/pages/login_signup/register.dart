import 'package:lifespan/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lifespan/pages/screens.dart';
import 'package:provider/provider.dart';
import '../../provider/Auth_Provider.dart';

class Register extends StatelessWidget {
  String email, password, firstname, lastname;
  Auth_Provider authProvider;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    authProvider = Provider.of(context,listen: false);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/doctor_bg.jpg'), fit: BoxFit.cover),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(1.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: WillPopScope(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ),
                body: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Text(
                        'Register',
                        style: loginBigTextStyle,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Create account',
                        style: whiteSmallLoginTextStyle,
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
                            hintText: 'First Name',
                            hintStyle: inputLoginTextStyle,
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val){
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
                            hintText: 'Last Name',
                            hintStyle: inputLoginTextStyle,
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val){
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
                          onChanged: (val){
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
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20.0),
                            hintText: 'Password',
                            hintStyle: inputLoginTextStyle,
                            border: InputBorder.none,
                          ),
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
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 20.0),
                            hintText: 'Confirm Password',
                            hintStyle: inputLoginTextStyle,
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val){
                            password = val;
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
                          if(await authProvider.signupUser(email, password, firstname, lastname) == 201) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Logged In"),
                            ));
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: Duration(milliseconds: 600),
                                    type: PageTransitionType.fade,
                                    child: BottomBar()));
                          }
                          else if (await authProvider.signupUser(email, password, firstname, lastname) == 404)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("User not Found"),
                              ));
                            }
                          else if (await authProvider.signupUser(email, password, firstname, lastname) == 500)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Server Error"),
                            ));
                          }
                          else
                          {
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
                            'Register',
                            style: inputLoginTextStyle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: inputLoginTextStyle,
                            ),
                            TextButton(
                              style: ButtonStyle(
                                  overlayColor:
                                  MaterialStateProperty.all(Colors.transparent)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                              child: Text(
                                'Login here',
                                style: inputLoginTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              onWillPop: () async {
                bool backStatus = onWillPop();
                if (backStatus) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                }
                return false;
              },
            ),
          ),
        ],
      ),
    );
  }

  onWillPop() {
    return true;
  }
}
