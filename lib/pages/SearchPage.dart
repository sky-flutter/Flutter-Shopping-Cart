import 'package:flutter/material.dart';
import 'package:shopping_cart/utils/CustomTextStyle.dart';
import 'package:shopping_cart/utils/CustomUtils.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> listCategory = new List();
  List<String> listShoesImage = new List();

  @override
  void initState() {
    super.initState();
    createCategoryList();
    shoesImage();
  }

  createCategoryList() {
    listCategory.add("MEN");
    listCategory.add("WOMEN");
    listCategory.add("KIDS");
    listCategory.add("PERSONAL CARE");
    listCategory.add("HOME");
  }

  void shoesImage() {
    listShoesImage.add("images/shoes_1.png");
    listShoesImage.add("images/shoes_2.png");
    listShoesImage.add("images/shoes_3.png");
    listShoesImage.add("images/shoes_4.png");
    listShoesImage.add("images/shoes_5.png");
    listShoesImage.add("images/shoes_6.png");
    listShoesImage.add("images/shoes_7.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: ListView(
        children: <Widget>[
          searchHeader(),
          horizontalDivider(),
          Utils.getSizedBox(height: 14),
          recentSearchListView(),
          Utils.getSizedBox(height: 14),
          categoryList(),
          Utils.getSizedBox(height: 14),
          wishListItemListView(),
          Utils.getSizedBox(height: 14),
          viewedItemListView()
        ],
      ),
    );
  }

  searchHeader() {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.arrow_back,
              color: Colors.grey.shade700,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Search for brands & products",
                    hintStyle: CustomTextStyle.textFormFieldRegular
                        .copyWith(color: Colors.grey, fontSize: 12),
                    labelStyle: CustomTextStyle.textFormFieldRegular
                        .copyWith(color: Colors.black, fontSize: 12),
                    border: textFieldBorder(),
                    enabledBorder: textFieldBorder(),
                    focusedBorder: textFieldBorder()),
              ),
            )
          ],
        ));
  }

  OutlineInputBorder textFieldBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(0)),
      borderSide: BorderSide(color: Colors.transparent));

  horizontalDivider() {
    return Container(
      color: Colors.grey.shade200,
      height: 1,
      width: double.infinity,
    );
  }

  categoryList() {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      color: Colors.white,
      width: double.infinity,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 30, minWidth: double.infinity),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return categoryListItem(listCategory[index], index);
          },
          primary: false,
          itemCount: listCategory.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  categoryListItem(String strCategory, int index) {
    double leftMargin = 8;
    double rightMargin = 8;
    if (index == 0) {
      leftMargin = 12;
    }
    if (index == listCategory.length - 1) {
      rightMargin = 12;
    }
    return Container(
      child: Text(
        strCategory,
        style: CustomTextStyle.textFormFieldBold
            .copyWith(color: Colors.grey.shade800, fontSize: 12),
      ),
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          color: Colors.white),
    );
  }

  recentSearchListView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "RECENT SEARCHES",
                  style: CustomTextStyle.textFormFieldBold.copyWith(
                      color: Colors.black.withOpacity(.5), fontSize: 11),
                ),
                Text(
                  "EDIT",
                  style: CustomTextStyle.textFormFieldBold
                      .copyWith(color: Colors.pink.shade700, fontSize: 11),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          Utils.getSizedBox(height: 6),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 60),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return recentSearchListViewItem(listShoesImage[index], index);
              },
              itemCount: listShoesImage.length,
              primary: false,
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }

  recentSearchListViewItem(String listShoesImage, int index) {
    double leftMargin = 8;
    double rightMargin = 8;
    if (index == 0) {
      leftMargin = 16;
    }
    if (index == this.listShoesImage.length - 1) {
      rightMargin = 16;
    }
    return Container(
      margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
      child: Column(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(listShoesImage), fit: BoxFit.cover),
                border: Border.all(color: Colors.grey.shade300, width: 1),
                shape: BoxShape.circle),
          ),
          Utils.getSizedBox(height: 4),
          Text(
            "Search Item",
            overflow: TextOverflow.ellipsis,
            textWidthBasis: TextWidthBasis.parent,
            softWrap: true,
            textAlign: TextAlign.center,
            style: CustomTextStyle.textFormFieldRegular
                .copyWith(fontSize: 10, color: Colors.black),
          )
        ],
      ),
    );
  }

  wishListItemListView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              "ITEMS YOU HAVE WISHLISTED",
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.black.withOpacity(.5), fontSize: 11),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return createWishListItem();
                },
                itemCount: 10,
                primary: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }

  createWishListItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.teal.shade200,
                image: DecorationImage(
                    image: AssetImage("images/shoes_1.png"), fit: BoxFit.cover),
              ),
            ),
            flex: 70,
          ),
          Utils.getSizedBox(height: 6),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "HIGHLANDER",
              style: CustomTextStyle.textFormFieldRegular
                  .copyWith(color: Colors.black.withOpacity(0.7), fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 6),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "\$12",
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.black, fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 6),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: <Widget>[
                Text(
                  "\$15",
                  style: CustomTextStyle.textFormFieldRegular.copyWith(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough),
                ),
                Utils.getSizedBox(width: 4),
                Text(
                  "55% OFF",
                  style: CustomTextStyle.textFormFieldRegular
                      .copyWith(color: Colors.red.shade400, fontSize: 12),
                ),
              ],
            ),
          ),
          Utils.getSizedBox(height: 6),
        ],
      ),
    );
  }

  viewedItemListView() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Text(
              "ITEMS YOU HAVE VIEWED",
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.black.withOpacity(.5), fontSize: 11),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return createWishListItem();
                },
                itemCount: 10,
                primary: false,
                scrollDirection: Axis.horizontal,
              ),
            ),
          )
        ],
      ),
    );
  }

  createViewedListItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.teal.shade200,
                image: DecorationImage(
                    image: AssetImage("images/shoes_1.png"), fit: BoxFit.cover),
              ),
            ),
            flex: 70,
          ),
          Utils.getSizedBox(height: 6),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "HIGHLANDER",
              style: CustomTextStyle.textFormFieldRegular
                  .copyWith(color: Colors.black.withOpacity(0.7), fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 6),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              "\$12",
              style: CustomTextStyle.textFormFieldBold
                  .copyWith(color: Colors.black, fontSize: 12),
            ),
          ),
          Utils.getSizedBox(height: 6),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: <Widget>[
                Text(
                  "\$15",
                  style: CustomTextStyle.textFormFieldRegular.copyWith(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough),
                ),
                Utils.getSizedBox(width: 4),
                Text(
                  "55% OFF",
                  style: CustomTextStyle.textFormFieldRegular
                      .copyWith(color: Colors.red.shade400, fontSize: 12),
                ),
              ],
            ),
          ),
          Utils.getSizedBox(height: 6),
        ],
      ),
    );
  }
}
