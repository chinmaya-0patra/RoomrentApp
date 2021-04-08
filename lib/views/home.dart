import 'package:flutter/material.dart';
import 'package:oyoapp/screens/apiScreen.dart';
import '../models/room.dart';
import '../providers/theme_provider.dart';
import '../widgets/popular_place_card.dart';
import '../widgets/recomended_card.dart';
import 'package:provider/provider.dart';
import 'package:oyoapp/pages/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  String dropdownBeds = '2-4 Beds';
  String dropdownFilter = 'Short by: Price';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.red,
          accentColor: Colors.blueAccent),
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Abhijeet "),
                accountEmail: Text("nayakabhi@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Text("A"),
                ),
              ),
              ListTile(
                title: Text('Home'),
                trailing: Icon(Icons.home),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                },
              ),
              ListTile(
                title: Text('Edit profile'),
                trailing: Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                },
              ),
              ListTile(
                title: Text("Change Password"),
                trailing: Icon(Icons.remove_red_eye),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                },
              ),
              ListTile(
                title: Text("My Complain"),
                trailing: Icon(Icons.bookmark),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => null));
                },
              ),
              ListTile(
                title: Text("Sign out"),
                trailing: Icon(Icons.subdirectory_arrow_left),
                onTap: () async {
                  await _auth.signOut();
                },
              ),
              ListTile(
                title: Text("Employee"),
                trailing: Icon(Icons.person),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => NewPage()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "My Location",
                          style: theme.textTheme.subtitle2,
                        ),
                        subtitle: Text(
                          "Odisha,India",
                          style:
                              theme.textTheme.headline3.copyWith(height: 1.5),
                        ),
                        trailing: InkWell(
                            onTap: () {
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .changeTheme();
                            },
                            child: Icon(Icons.notifications_outlined)),
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 25.0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 14.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: DropdownButton(
                              value: dropdownBeds,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 20.0,
                              ),
                              underline: Container(),
                              onChanged: (String beds) {
                                setState(() {
                                  dropdownBeds = beds;
                                });
                              },
                              items: ["2-4 Beds", "2 Beds", "3 Beds", "4 Beds"]
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e,
                                          style: theme.textTheme.bodyText1),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 14.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: DropdownButton(
                              value: dropdownFilter,
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 20.0,
                              ),
                              underline: Container(),
                              onChanged: (String beds) {
                                setState(() {
                                  dropdownFilter = beds;
                                });
                              },
                              items: [
                                "Short by: Price",
                                "Short by: Name",
                                "Short by: Location",
                                "Short by: Type",
                              ]
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  height: 340.0,
                  child: ListView.builder(
                    itemCount: roomList.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var room = roomList[index];
                      return RecommendedCard(room: room);
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                ListTile(
                  title:
                      Text("Popular Place", style: theme.textTheme.headline3),
                  trailing: Text("View All", style: theme.textTheme.subtitle1),
                ),
                ListView.builder(
                  itemCount: roomList.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    var room = roomList[index];
                    return PopularPlaceCard(room: room);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
