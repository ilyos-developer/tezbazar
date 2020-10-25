import 'package:flutter/material.dart';
import 'package:tezbazar/screens/components/universal_product_card.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: "Просмотрено",
    ),
    Tab(
      text: "Куплено",
    ),
  ];

  List<Widget> containers = [
    Scaffold(
      body: ListView(
        children: [
          UniversalProductCard(
            isButton: true,
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
    ),
    Scaffold(
      body: ListView(
        children: [
          UniversalProductCard(
            isDate: true,
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "400 г",
            price: "15000 сум",
            purchaseDate: "07.07.2020",
          ),
          UniversalProductCard(
            isDate: true,
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: 'Овсяная крупа “Геркулес"',
            quantity: "400 г",
            price: "15000 сум",
            purchaseDate: "20.05.2020",
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("История"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          bottom: TabBar(tabs: myTabs),
        ),
        body: TabBarView(
          children: containers,
        ),
      ),
    );
  }
}
