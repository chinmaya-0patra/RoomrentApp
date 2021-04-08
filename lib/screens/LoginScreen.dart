import 'package:flutter/material.dart';
import 'package:oyoapp/homelanding.dart';
import 'package:page_transition/page_transition.dart';
import 'package:oyoapp/library/Common.dart';
import 'package:oyoapp/pages/auth.dart';
import 'package:oyoapp/screens/RegisterScreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();
  bool showSpinner = false;
  String error = '';

  // text field state
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height;
    double abovePadding = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom +
        30;
    print(abovePadding);
    double leftHeight = screenHeight - abovePadding;
    return Scaffold(
        backgroundColor: white,
        appBar: null,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SingleChildScrollView(
            // physics: BouncingScrollPhysics(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: leftHeight,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 15, bottom: 5),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 8, right: 8, bottom: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(80),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 0.0),
                                    ),
                                    // disabledBorder: new InputBorder(borderSide: BorderSide.none),
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                    filled: true,
                                    fillColor: darkGrey,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 17, vertical: 12),

                                    hintText: "abhi@gmail.com",
                                  ),
                                  validator: (val) =>
                                      val.isEmpty ? 'Enter Email' : null,
                                  onChanged: (val) {
                                    setState(() => email = val);
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ]),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 15, bottom: 5),
                                  child: Text(
                                    "Password",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 8, bottom: 15),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(80),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      // disabledBorder: new InputBorder(borderSide: BorderSide.none),
                                      hintStyle: TextStyle(
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic),
                                      filled: true,
                                      fillColor: darkGrey,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 17, vertical: 12),

                                      hintText: "**********",
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter password' : null,
                                    onChanged: (val) {
                                      setState(() => password = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 45,
                          child: RaisedButton(
                            // padding: EdgeInsets.only(bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(35.0)),
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              dynamic result =
                                  await _auth.loginWithEmail(email, password);
                              if (result == null) {
                                setState(() {
                                  error = 'Invalid email id';
                                });
                              } else {
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeLanding()));
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            },
                            color: primaryColor,
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(
                                        letterSpacing: 1,
                                        color: white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ]),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Can't Login?"),
                          FlatButton(
                            padding: EdgeInsets.only(left: 5),
                            onPressed: () {},
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have a account?"),
                            FlatButton(
                              padding: EdgeInsets.only(right: 20),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: RegisterScreen()));
                              },
                              child: Text(
                                "Register ",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
