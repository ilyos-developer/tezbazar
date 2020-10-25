import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezbazar/screens/components/universal_product_card.dart';
import 'components/drawer_catalog.dart';

class CatalogScreen extends StatefulWidget {
  final int index;

  const CatalogScreen({Key key, this.index}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState(index);
}

class _CatalogScreenState extends State<CatalogScreen> {
  final int index;

  _CatalogScreenState(this.index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Каталог"),
      ),
      backgroundColor: Colors.white,
      drawer: DrawerScreen(),
      body: ListView(
        children: [
          UniversalProductCard(
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "400 г",
            price: "15000 сум",
          ),
          UniversalProductCard(
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "2000 г",
            price: "12000 сум",
          ),
          UniversalProductCard(
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "600 г",
            price: "8000 сум",
          ),
          UniversalProductCard(
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "300 г",
            price: "10000 сум",
          ),
          UniversalProductCard(
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "1000 г",
            price: "6000 сум",
          ),
        ],
      ),
    );
  }
}
