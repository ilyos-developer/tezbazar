import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../constant.dart';

class PodCatalogScreen extends StatefulWidget {
  final String title;
  final String slug;

  const PodCatalogScreen({Key key, this.title, this.slug}) : super(key: key);

  @override
  _PodCatalogScreenState createState() => _PodCatalogScreenState(title: title, slug: slug);
}

class _PodCatalogScreenState extends State<PodCatalogScreen> {
  final String title;
  final String slug;

  _PodCatalogScreenState({this.title, this.slug});

  void initState() {
    super.initState();
    this.getData();
  }

  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://devuz.ru/api/1/catalog/$slug"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(utf8.decode(response.bodyBytes));
    });

    return "Success!";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        height: size.height * 0.82,
        child: new ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) =>
              buildProductsList(context, index),
        ),
      ),
    );
  }

  Row buildProductsList(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          child: CachedNetworkImage(
            imageUrl: "https://devuz.ru" + data[index]["images"][0]["file"],
            placeholder: _loader,
            errorWidget: _error,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 16, left: 12),
          height: size.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          width: size.height * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                data[index]["name"],
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: kTextFontFamily,
                ),
              ),
              SizedBox(height: 9),
              Text(
                data[index]["price"] + " сум",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: kTextFontFamily,
                ),
              ),
              SizedBox(height: 9),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/minus_pad.svg'),
                  ),
                  Text(
                    data[index]["volume"],
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: kTextFontFamily,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/plus_pad.svg'),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
