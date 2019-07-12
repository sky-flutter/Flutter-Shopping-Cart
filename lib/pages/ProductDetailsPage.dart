import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/CustomTextStyle.dart';
import 'package:shopping_cart/utils/CustomUtils.dart';

import 'CartPage.dart';

class ProductDetailsPage extends StatefulWidget {
  String heroTag;

  ProductDetailsPage(this.heroTag);

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState(heroTag);
}

class _ProductDetailsPageState extends State<ProductDetailsPage>
    with TickerProviderStateMixin<ProductDetailsPage> {
  List<Color> listColor = new List();
  List<String> listSize = new List();
  int selectedColor = -1;

  var selectedSize = -1;

  var heroTag;

  _ProductDetailsPageState(this.heroTag);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addColor();
    addSize();
  }

  void addColor() {
    listColor.add(Colors.red);
    listColor.add(Colors.green);
    listColor.add(Colors.yellow);
    listColor.add(Colors.black);
    listColor.add(Colors.teal);
    listColor.add(Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    var halfOfScreen = MediaQuery.of(context).size.height / 1.5;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Builder(builder: (context) {
        return Container(
          height: double.infinity,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Hero(
                  tag: heroTag,
                  child: Image(
                    image: AssetImage("images/details_shoes_image.webp"),
                    height: halfOfScreen,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 28,
                      width: 32,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 14,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 4,
                            width: 4,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                          Container(
                            height: 28,
                            width: 32,
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ),
                              alignment: Alignment.center,
                              onPressed: () {
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => CartPage()));
                              },
                              iconSize: 14,
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: productDetailsSection(),
              )
            ],
          ),
        );
      }),
    );
  }

  productDetailsSection() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 320,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  "NIKE XTM Basketball Shoes",
                  style: CustomTextStyle.textFormFieldSemiBold
                      .copyWith(color: Colors.black),
                ),
              ),
              IconButton(icon: Icon(Icons.close), onPressed: () {})
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            alignment: Alignment.topLeft,
            child: Text(
              "Colour",
              textAlign: TextAlign.start,
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createColorItem(index);
              },
              itemCount: listColor.length,
            ),
          ),
          Utils.getSizedBox(height: 16),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 8),
            child: Text(
              "Size",
              style: CustomTextStyle.textFormFieldMedium
                  .copyWith(color: Colors.black.withOpacity(0.8), fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 40),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return createSizeItem(index);
              },
              itemCount: listSize.length,
            ),
          ),
          Utils.getSizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Text(
                  "Total",
                  style: CustomTextStyle.textFormFieldMedium
                      .copyWith(color: Colors.grey, fontSize: 12),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8),
                child: Text(
                  "\$299.00",
                  style: CustomTextStyle.textFormFieldBlack.copyWith(
                      color: Colors.greenAccent.shade700, fontSize: 14),
                ),
              ),
            ],
          ),
          Utils.getSizedBox(height: 16),
          RaisedButton(
            onPressed: () {},
            color: Colors.green,
            padding: EdgeInsets.only(top: 12, left: 60, right: 60, bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: Text(
              "Add To Cart",
              style: CustomTextStyle.textFormFieldSemiBold
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
    );
  }

  Container createSizeItem(int index) {
    return Container(
      width: 28,
      margin: EdgeInsets.all(4),
      height: 28,
      padding: EdgeInsets.only(top: 8),
      child: Text(
        listSize[index],
        style: CustomTextStyle.textFormFieldSemiBold
            .copyWith(fontSize: 12, color: Colors.black.withOpacity(0.8)),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: selectedSize == index ? Colors.blue : Colors.grey,
              width: 1),
          shape: BoxShape.circle),
    );
  }

  GestureDetector createColorItem(int index) {
    return GestureDetector(
      child: Container(
        width: 24,
        margin: EdgeInsets.all(4),
        height: 24,
        decoration: BoxDecoration(
            color: listColor[index],
            border: Border.all(
                color: Colors.grey, width: selectedColor == index ? 2 : 0),
            shape: BoxShape.circle),
      ),
      onTap: () {
        setState(() {
          selectedColor = index;
        });
      },
    );
  }

  void addSize() {
    listSize.add("4");
    listSize.add("5");
    listSize.add("6");
    listSize.add("7");
    listSize.add("8");
    listSize.add("9");
    listSize.add("10");
  }
}
