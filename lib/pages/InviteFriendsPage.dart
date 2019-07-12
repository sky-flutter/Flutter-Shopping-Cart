import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:shopping_cart/utils/CustomTextStyle.dart';
import 'package:shopping_cart/utils/CustomUtils.dart';

class InviteFriendsPage extends StatefulWidget {
  @override
  _InviteFriendsPageState createState() => _InviteFriendsPageState();
}

class _InviteFriendsPageState extends State<InviteFriendsPage> {
  static const platform = MethodChannel('flutter.native/helper');
  String shareResponse = "Sharing";

  Future<String> shareApp() async {
    String response = "";
    try {
      String result = await platform.invokeMethod("shareApp");
      print("METHOD : " + result);
      response = result;
    } on PlatformException catch (e) {
      response = "Failed "
          "to shared app";
    }
    setState(() {
      shareResponse = response;
    });
    return shareResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Invite Friends",
          style: CustomTextStyle.textFormFieldBold.copyWith(fontSize: 18),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Builder(
        builder: (context) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[createHeader(), createMiddle()],
                ),
                flex: 90,
              ),
              createFooter(context)
            ],
          );
        },
      ),
    );
  }

  Expanded createFooter(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 16),
                onPressed: () {
                  shareApp();
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text(shareResponse)));
                },
                color: Colors.blue,
                child: Text(
                  "Share Link",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            flex: 85,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 4, bottom: 8, top: 6),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 14),
                onPressed: () {},
                child: Image(
                  image: AssetImage("images/ic_qr_code.png"),
                  color: Colors.white,
                ),
                color: Colors.blue,
              ),
            ),
            flex: 15,
          )
        ],
      ),
      flex: 10,
    );
  }

  createHeader() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 160,
            margin: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/ic_refer_friends_bg.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Invite Friends & Earn Points",
                style: CustomTextStyle.textFormFieldBold,
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "When you invite friends to join Carter, you can 100 points to each friends.Whenever your friends consume through Carter, you will get a 5% bonus",
                style: CustomTextStyle.textFormFieldBold
                    .copyWith(color: Colors.black.withOpacity(0.8)),
              ))
        ],
      ),
    );
  }

  createMiddle() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "My Invitation",
                  style: CustomTextStyle.textFormFieldBold.copyWith(
                      fontSize: 14, color: Colors.black.withOpacity(0.9)),
                ),
                Text(
                  "Details",
                  style: CustomTextStyle.textFormFieldBold
                      .copyWith(fontSize: 14, color: Colors.blue),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            height: 1,
            width: double.infinity,
          ),
          Container(
            height: 60,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return gridItem();
              },
              itemCount: 2,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }

  gridItem() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
        top: 8,
      ),
      height: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Utils.getSizedBox(width: 8),
          Icon(
            Icons.menu,
            color: Colors.blue,
          ),
          Utils.getSizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "0.34123205",
                style: CustomTextStyle.textFormFieldBold
                    .copyWith(color: Colors.blue),
              ),
              Utils.getSizedBox(width: 4),
              Container(
                child: Text(
                  "Today Reward",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey.shade500, fontSize: 12),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
