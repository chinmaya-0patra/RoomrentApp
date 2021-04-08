import 'package:oyoapp/pages/user.dart';
import 'package:oyoapp/screens/LandingScreen.dart';
import 'package:oyoapp/homelanding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return LandingScreen();
    } else {
      return HomeLanding();
    }
  }
}
