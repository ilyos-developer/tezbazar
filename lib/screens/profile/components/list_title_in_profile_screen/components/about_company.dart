import 'package:flutter/material.dart';

class AboutCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("О компании"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1. Lorem Ipsum",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                          "Sem tortor sollicitudin mollis urna. Euismod molestie eu fusce orci. "
                          "Elit risus libero, sed quisque ac. Nunc, lacus, dolor ante suspendisse non.",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
