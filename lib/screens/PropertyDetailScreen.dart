import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oyoapp/library/Card.dart';
import 'package:oyoapp/library/Common.dart';
import 'package:oyoapp/models/Property.dart';

class PropertyDetailScreen extends StatefulWidget {
  final List<PropertyDetail> propertyDetails;
  PropertyDetailScreen({this.propertyDetails});
  @override
  _PropertyDetailScreenState createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.propertyDetails.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Container(
              height: 260,
              color: Colors.transparent,
              margin: EdgeInsets.only(top: 90),
              child: Swiper(
                loop: false,
                itemWidth: 340,
                itemHeight: 400,
                index: 1,
                itemCount: widget.propertyDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return PropertyDetailCard(
                      image: widget.propertyDetails[index].image,
                      title: widget.propertyDetails[index].title,
                      description: widget.propertyDetails[index].description);
                },
                viewportFraction: 0.75,
                pagination: new SwiperPagination(
                    alignment: Alignment(0, 1.4),
                    builder: DotSwiperPaginationBuilder(color: grey)),
                scale: 0.8,
                layout: SwiperLayout.DEFAULT,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 400),
                // color: primaryColor,
                height: 170,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CircleAvatar(
                            maxRadius: 45,
                            minRadius: 45,
                            backgroundColor: grey,
                            child: Image.asset("assets/images/avatar.png",
                                height: 70),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Icon(
                                    SimpleLineIcons.getIconData("user"),
                                    size: 17,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Tancent Name",
                                    style: TextStyle(fontSize: 12, color: grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Abhijeet",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    SimpleLineIcons.getIconData("clock"),
                                    size: 17,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Duration : ",
                                    style: TextStyle(fontSize: 12, color: grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "19 months",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    AntDesign.getIconData("creditcard"),
                                    size: 17,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Rent: ",
                                    style: TextStyle(fontSize: 12, color: grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    " 100/month",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    AntDesign.getIconData("profile"),
                                    size: 17,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Rent Paid On : ",
                                    style: TextStyle(fontSize: 12, color: grey),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "19 Jan, 2021",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 45,
                        child: RaisedButton(
                          // padding: EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(35.0)),
                          onPressed: () {},
                          color: primaryColor,
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "View Agreement",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      color: white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
