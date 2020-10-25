import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant.dart';

class UniversalProductCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final String quantity;
  final String purchaseDate;
  final bool isButton;
  final bool isDate;

  const UniversalProductCard(
      {Key key,
      this.imageUrl,
      this.productName,
      this.price,
      this.quantity,
      this.purchaseDate,
      this.isButton,
      this.isDate})
      : super(key: key);

  @override
  _UniversalProductCardState createState() => _UniversalProductCardState(
      imageUrl: imageUrl,
      productName: productName,
      price: price,
      quantity: quantity,
      purchaseDate: purchaseDate,
      isButton: isButton,
      isDate: isDate);
}

class _UniversalProductCardState extends State<UniversalProductCard> {
  final String imageUrl;
  final String productName;
  final String price;
  final String quantity;
  final String purchaseDate;
  final bool isButton;
  final bool isDate;

  _UniversalProductCardState({
    this.imageUrl,
    this.productName,
    this.price,
    this.quantity,
    this.purchaseDate,
    this.isButton,
    this.isDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 5,
      child: Row(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 16, left: 12),
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: 230,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: kTextFontFamily,
                      ),
                    ),
                    Icon(Icons.favorite_border)
                  ],
                ),
                SizedBox(height: 9),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: kTextFontFamily,
                  ),
                ),
                SizedBox(height: 9),
                Row(
                  children: [
                    Text(
                      quantity,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: kTextFontFamily,
                      ),
                    ),
                    visableButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget visableButton() {
    if (isButton == true) {
      return Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/minus_pad.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/plus_pad.svg'),
          ),
        ],
      );
    } else if (isDate == true) {
      return Text(' / ' + purchaseDate);
    } else {
      return Container();
    }
  }
}
