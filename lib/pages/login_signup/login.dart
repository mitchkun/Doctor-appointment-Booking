import 'package:flutter/material.dart';
import 'package:lifespan/Components/InputFields.dart';
import 'package:lifespan/constant/constant.dart';
import 'package:lifespan/pages/home/home.dart';
import 'package:lifespan/provider/Auth_Provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../bottom_bar.dart';
import 'styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import '../../Components/SignUpLink.dart';
import '../../Components/Form.dart';
import '../../Components/SignInButton.dart';
import '../../Components/WhiteTick.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  LoginScreenState createState() => new LoginScreenState();
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation(
      {Key key, this.buttonController, String email, String password})
      : buttonSqueezeanimation = new Tween(
          begin: 320.0,
          end: 70.0,
        ).animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.0,
              0.150,
            ),
          ),
        ),
        buttomZoomOut = new Tween(
          begin: 70.0,
          end: 1000.0,
        ).animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.550,
              0.999,
              curve: Curves.bounceOut,
            ),
          ),
        ),
        containerCircleAnimation = new EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 50.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);
  Auth_Provider authProvider;

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;
  final Animation buttomZoomOut;

  Future<Null> _playAnimation(BuildContext context) async {
    try {
      await buttonController.forward();
      await buttonController.reverse();

      // if (await authProvider.signinUser(email, password) == 200) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("Logged In"),
      //   ));
      //   Navigator.pushReplacementNamed(context, "/home");
      // } else if (await authProvider.signinUser(email, password) == 404) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("Incorrect Credentials"),
      //   ));
      // } else if (await authProvider.signinUser(email, password) == 500) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("User not Found"),
      //   ));
      // } else if (await authProvider.signinUser(email, password) == 422) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("Parameters not supplied"),
      //   ));
      // } else if (await authProvider.signinUser(email, password) == 211) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text("Verify Your email Address"),
      //   ));
      // }
    } on TickerCanceled {}
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    authProvider = Provider.of(context, listen: false);
    return new Padding(
      padding: buttomZoomOut.value == 70
          ? const EdgeInsets.only(bottom: 50.0)
          : containerCircleAnimation.value,
      child: new InkWell(
          onTap: () {
            _playAnimation(context);
          },
          child: new Hero(
            tag: "fade",
            child: buttomZoomOut.value <= 300
                ? new Container(
                    width: buttomZoomOut.value == 70
                        ? buttonSqueezeanimation.value
                        : buttomZoomOut.value,
                    height:
                        buttomZoomOut.value == 70 ? 60.0 : buttomZoomOut.value,
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: const Color.fromRGBO(247, 64, 106, 1.0),
                      borderRadius: buttomZoomOut.value < 400
                          ? new BorderRadius.all(const Radius.circular(30.0))
                          : new BorderRadius.all(const Radius.circular(0.0)),
                    ),
                    child: buttonSqueezeanimation.value > 75.0
                        ? new Text(
                            "Sign In",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3,
                            ),
                          )
                        : buttomZoomOut.value < 300.0
                            ? new CircularProgressIndicator(
                                value: null,
                                strokeWidth: 1.0,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              )
                            : null)
                : new Container(
                    width: buttomZoomOut.value,
                    height: buttomZoomOut.value,
                    decoration: new BoxDecoration(
                      shape: buttomZoomOut.value < 500
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      color: const Color.fromRGBO(247, 64, 106, 1.0),
                    ),
                  ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    buttonController.addListener(() {
      if (buttonController.isCompleted) {
        builder:
        (_) => new Home();
      }
    });
    return new AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}

class LoginScreenState extends State<Login> with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  final FocusNode f1 = new FocusNode();
  final FocusNode f2 = new FocusNode();
  Auth_Provider authProvider;
  var animationStatus = 0;
  String email, password;
  @override
  void initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 3000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation(
      Auth_Provider authProvider, String email, String password) async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();

      if (await authProvider.signinUser(email, password) == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Logged In"),
        ));
        Navigator.push(
            context,
            PageTransition(
                duration: Duration(milliseconds: 600),
                type: PageTransitionType.fade,
                child: BottomBar()));
      } else if (await authProvider.signinUser(email, password) == 404) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Incorrect Credentials"),
        ));
      } else if (await authProvider.signinUser(email, password) == 500) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("User not Found"),
        ));
      } else if (await authProvider.signinUser(email, password) == 422) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Parameters not supplied"),
        ));
      } else if (await authProvider.signinUser(email, password) == 211) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Verify Your email Address"),
        ));
      }
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) {
            return new AlertDialog(
              title: new Text('Are you sure?'),
              actions: <Widget>[
                new TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: new Text('No'),
                ),
                new TextButton(
                  onPressed: () => new Home(),
                  child: new Text('Yes'),
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of(context, listen: false);
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
          body: new Container(
              decoration: new BoxDecoration(
                image: backgroundImage,
              ),
              child: new Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                    colors: <Color>[
                      const Color.fromRGBO(162, 146, 199, 0.8),
                      const Color.fromRGBO(51, 51, 63, 0.9),
                    ],
                    stops: [0.2, 1.0],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                  )),
                  child: new ListView(
                    padding: const EdgeInsets.all(0.0),
                    children: <Widget>[
                      new Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(height: 100),
                              new Tick(image: tick),
                              new Container(
                                margin:
                                    new EdgeInsets.symmetric(horizontal: 20.0),
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    new Form(
                                        child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        new TextField(
                                          focusNode: f1,
                                          style: inputLoginTextStyle,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 20.0),
                                            hintText: 'Email',
                                            hintStyle: inputLoginTextStyle,
                                            border: InputBorder.none,
                                          ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          onChanged: (val) {
                                            email = val;
                                          },
                                        ),
                                        new TextField(
                                          focusNode: f2,
                                          style: inputLoginTextStyle,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                EdgeInsets.only(left: 20.0),
                                            hintText: 'Password',
                                            hintStyle: inputLoginTextStyle,
                                            border: InputBorder.none,
                                          ),
                                          keyboardType: TextInputType.text,
                                          onChanged: (val) {
                                            password = val;
                                          },
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              new SignUp()
                            ],
                          ),
                          animationStatus == 0
                              ? new Padding(
                                  padding: const EdgeInsets.only(bottom: 50.0),
                                  child: new InkWell(
                                      onTap: () {
                                        setState(() {
                                          animationStatus = 1;
                                        });
                                        _playAnimation(
                                            authProvider, email, password);
                                      },
                                      child: new SignIn()),
                                )
                              : new StaggerAnimation(
                                  buttonController:
                                      _loginButtonController.view),
                        ],
                      ),
                    ],
                  ))),
        )));
  }
}
