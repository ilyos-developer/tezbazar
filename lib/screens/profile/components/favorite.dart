import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/screens/components/universal_product_card.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Избранное"),
      ),
      body: ListView(
        children: [
          UniversalProductCard(
            isButton: false,
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "400 г",
            price: "15000 сум",
          ),
          UniversalProductCard(
            isButton: true,
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "400 г",
            price: "15000 сум",
          ),
        ],
      ),
    );
  }
}
