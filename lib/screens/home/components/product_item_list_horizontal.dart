import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezbazar/constant.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;

class ProductListItemHorizontal extends StatefulWidget {
  const ProductListItemHorizontal({Key key}) : super(key: key);

  @override
  _ProductListItemHorizontalState createState() =>
      _ProductListItemHorizontalState();
}

class _ProductListItemHorizontalState extends State<ProductListItemHorizontal> {
  void initState() {
    super.initState();
    this.getData();
  }

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://devuz.ru/api/1/products"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(utf8.decode(response.bodyBytes));
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) => buildProductsList(context, index),
      ),
    );
  }

  InkWell buildProductsList(BuildContext context, int index) {
    return InkWell(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) =>
//            ),
//          ),
//        );
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 160,
          height: 265,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, top: 8),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
              Container(
                width: 150,
                child: CachedNetworkImage(
                  imageUrl:
                  "https://devuz.ru" + data[index]["images"][0]["file"],
                  placeholder: _loader,
                  errorWidget: _error,
                ),
//                height: 180,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    data[index]["volume"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 2.0),
                child: Text(
                  data[index]["price"] + " сум",
                  style: TextStyle(
                      fontFamily: kTextFontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.only(left: 10.0, top: 3.0, bottom: 5),
                child: Text(
                  data[index]["name"],
                  style:
                  TextStyle(fontFamily: kTextFontFamily, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loader(BuildContext context, String url) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error(BuildContext context, String url, dynamic error) {
    print(error);
    return const Center(child: Icon(Icons.error));
  }

}
