import 'package:flutter/material.dart';
import 'package:lifespan/pages/home/home.dart';
import 'package:lifespan/pages/login_signup/login.dart';

class Routes {
  Routes() {
    runApp(new MaterialApp(
      title: "Dribbble Animation App",
      debugShowCheckedModeBanner: false,
      home: new Login(),
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/login':
            return new MyCustomRoute(
              builder: (_) => new Login(),
              settings: settings,
            );

          case '/home':
            return new MyCustomRoute(
              builder: (_) => new Home(),
              settings: settings,
            );
        }
      },
    ));
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // if (settings.arguments) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}
