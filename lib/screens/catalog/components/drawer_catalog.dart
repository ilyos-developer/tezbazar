import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tezbazar/screens/catalog/components/pod_catalog_screen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

List data;

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future getData() async {
    var response = await http.get(
        Uri.encodeFull("https://devuz.ru/api/1/catalog"),
        headers: {"Accept": "application/json"});
    return json.decode(utf8.decode(response.bodyBytes));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: _buildNewTiles(),
      ),
    );
  }

  FutureBuilder _buildNewTiles() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text(
            "Ошибка",
          );
        }
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
            var element = snapshot.data[index];
            return _buildTile(element);
          },
        );
      },
      future: getData(),
    );
  }

  _buildTile(element) {
    return ExpansionTile(
        title: Text(element['name']),
        children: _buildChildren(element['children']));
  }

  List<Widget> _buildChildren(List children) {
    List<Widget> childCategories = [];
    children.forEach((childCategory) {
      childCategories.add(
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PodCatalogScreen(
                  title: childCategory["name"],
                  slug: childCategory["slug"],
                ),
              ),
            );
          },
          dense: true,
          title: Text(childCategory["name"]),
          subtitle: Text(
            "кол-во товаров: " + childCategory["get_products_count"].toString(),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
      );
    });
    return childCategories;
  }
}
