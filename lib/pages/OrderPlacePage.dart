import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/CustomTextStyle.dart';

class OrderPlacePage extends StatefulWidget {
  @override
  _OrderPlacePageState createState() => _OrderPlacePageState();
}

class _OrderPlacePageState extends State<OrderPlacePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image(
                      image: AssetImage("images/ic_thank_you.png"),
                      width: 300,
                    ),
                  ),
                ),
                flex: 5,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8),
                  child: Column(
                    children: <Widget>[
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "\n\nThank you for your purchase. Our company values each and every customer. We strive to provide state-of-the-art devices that respond to our clients’ individual needs. If you have any questions or feedback, please don’t hesitate to reach out.",
                              style: CustomTextStyle.textFormFieldMedium
                                  .copyWith(fontSize: 12, color: Colors.grey),
                            )
                          ])),
                      SizedBox(
                        height: 24,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text(
                          "View Order",
                          style: CustomTextStyle.textFormFieldMedium
                              .copyWith(color: Colors.white),
                        ),
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(24))),
                      )
                    ],
                  ),
                ),
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
