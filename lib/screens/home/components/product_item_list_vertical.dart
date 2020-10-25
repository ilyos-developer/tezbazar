import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/models/products.dart';
import 'package:tezbazar/screens/components/universal_product_card.dart';
import 'package:tezbazar/screens/home/components/product_item_list_horizontal.dart';

class ProductListItemVertical extends StatelessWidget {
  const ProductListItemVertical({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: productList.length,
        itemBuilder: (context, index) => buildMovieList(context, index),
      ),
    );
  }

  InkWell buildMovieList(BuildContext context, int index) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductListItemVertical(
//            movie: productList[index],
              ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          UniversalProductCard(
            imageUrl:
                "https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg",
            productName: "Гарох",
            price: "8000 сум",
            quantity: "1 кг",
          ),
        ],
      ),
    );
  }
}
