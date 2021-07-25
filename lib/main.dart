import 'package:lifespan/appBehaviour/my_behaviour.dart';
import 'package:lifespan/pages/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'provider/Auth_Provider.dart';
import 'constant/constant.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Auth_Provider(),
    child: MaterialApp(
      title: 'Lifespan Diagnostics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Noto Sans',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      home: SplashScreen(),
    )
    );
  }
}
