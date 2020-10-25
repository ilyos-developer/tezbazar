import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/screens/profile/components/person_address.dart';

import '../../../constant.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final fromKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  var name;
  var address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Новый адрес"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          child: Form(
            key: fromKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Названия"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Пожалуйста введите названия";
                      }
                      return null;
                    },
                    onSaved: (value) => name = value.trim(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: "Адрес"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Пожалуйста напишите адрес";
                      }
                      return null;
                    },
                    onSaved: (value) => address = value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        color: Colors.green,
        onPressed: () {
          validateInputs();
        },
        child: Text(
          "Сохранить",
          style: TextStyle(color: kTextColor),
        ),
      ),
    );
  }

  void validateInputs() {
    if (fromKey.currentState.validate()) {
      fromKey.currentState.save();
      print(name);
      print(address);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PersonAddress(),
          ),
        );
        isAutoValidate = true;
      });
    } else {
      //after input, turn on automatic inspection
    }
  }
}
