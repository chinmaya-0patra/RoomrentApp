import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oyoapp/pages/user.dart';
import 'package:oyoapp/pages/auth.dart';
import 'package:oyoapp/pages/wrapper.dart';
import 'locator.dart';

void main() => {setupLocator(), runApp(MyApp())};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          // debugShowMaterialGrid: true,
          home: Wrapper(),
        ));
  }
}
