import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:oyoapp/library/Common.dart';
import 'package:oyoapp/homelanding.dart';
import 'package:oyoapp/screens/LoginScreen.dart';
import 'package:oyoapp/pages/auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthService _auth = AuthService();
  bool showSpinner = false;
  // final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  String fname = '';
  String lname = '';
  String number = '';
  String confirmpassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _formKey,
      backgroundColor: white,
      appBar: null,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: <Widget>[
                AnimatedContainer(
                  height: MediaQuery.of(context).size.height,
                  duration: Duration(milliseconds: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
                                    "Firstname",
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
                                      border: OutlineInputBorder(
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

                                      hintText: "Abhijeet",
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter firstname' : null,
                                    onChanged: (val) {
                                      setState(() => fname = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                    "Lastname",
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
                                      border: OutlineInputBorder(
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

                                      hintText: "Nayak",
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter Lastname' : null,
                                    onChanged: (val) {
                                      setState(() => lname = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                      border: OutlineInputBorder(
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
                          ),
                        ],
                      ),
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
                                    "Mobile",
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
                                      border: OutlineInputBorder(
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

                                      hintText: "8899776655",
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter Mobilenumber'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => number = val);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(80),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 0.0),
                                      ),
                                      border: OutlineInputBorder(
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

                                      hintText: "************",
                                    ),
                                    obscureText: true,
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
                                    "ConfirmPassword",
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
                                      border: OutlineInputBorder(
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

                                      hintText: "*********",
                                    ),
                                    obscureText: true,
                                    validator: (val) => val.isEmpty
                                        ? 'confirm your password'
                                        : null,
                                    onChanged: (val) {
                                      setState(() => confirmpassword = val);
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
                          width: MediaQuery.of(context).size.width * 0.9,
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
                                  await _auth.registerWithEmailAndPassword(
                                      fname,
                                      lname,
                                      email,
                                      number,
                                      password,
                                      confirmpassword);
                              if (result == null) {
                                setState(() {
                                  error = 'Please supply a valid email';
                                });
                              }
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeLanding()));
                              setState(() {
                                showSpinner = false;
                              });
                            },
                            color: primaryColor,
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: "Register",
                                    style: TextStyle(
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
                          Text(
                            "By Sign up, you agree our ",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12, fontStyle: FontStyle.italic),
                          ),
                          FlatButton(
                            padding: EdgeInsets.only(left: 5),
                            onPressed: () {},
                            child: Text(
                              "Terms and Condition",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      // input(labelText: "Mobile", hintText: "dave@gmail.com"),
                    ],
                  ),
                ),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Divider(
                          height: 0.5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have a account?",
                              style: TextStyle(),
                            ),
                            FlatButton(
                              padding: EdgeInsets.only(right: 20),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        child: LoginScreen()));
                              },
                              child: Text(
                                "Login ",
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
            )),
      ),
    );
  }
}
