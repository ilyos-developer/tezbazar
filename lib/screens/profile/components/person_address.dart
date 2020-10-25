import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/screens/profile/components/add_address.dart';

import '../../../constant.dart';

class PersonAddress extends StatefulWidget {
  @override
  _PersonAddressState createState() => _PersonAddressState();
}

class _PersonAddressState extends State<PersonAddress> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои адреса"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.grey[200],
          elevation: 5,
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 16, left: 12),
                height: 120,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Дом',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: kTextFontFamily,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {

                            },
                          )
                        ],
                      ),
                      Text(
                        'город Ургенч, улица Абулгази Баходирхон, дом 5, квартира 999 город Ургенч, '
                            'улица Абулгази Баходирхон, дом 5, квартира 999 город Ургенч, улица Абулгази Баходирхон, квартира 999',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: kTextFontFamily,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAddress(),
            ),
          );
        },
        child: Text(
          "Добавить адрес",
          style: TextStyle(color: kTextColor),
        ),
      ),
    );
  }
}
