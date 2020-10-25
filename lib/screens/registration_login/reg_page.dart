import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/screens/registration_login/validate_sms_code.dart';

import '../../constant.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final fromKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  var city;
  var tel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Регистрация"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              onWillPop: willPop,
              key: fromKey,
              autovalidate: isAutoValidate,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Город"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Пожалуйста введите город";
                      }
                      return null;
                    },
                    onSaved: (value) => city = value,
                  ),
                  TextFormField(
                    maxLength: 9,
                    decoration: const InputDecoration(
                        labelText: "Номер телефона", prefixText: '+998'),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value.length != 9) {
                        return "Пожалуйста введите номер правильно";
                      }
                      return null;
                    },
                    onSaved: (value) => tel = value,
                  ),
                  SizedBox(height: 460),
                  RaisedButton(
                    color: Colors.green,
                    onPressed: validateInputs,
                    child: Text(
                      "Далее",
                      style: TextStyle(color: kTextColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateInputs() {
    if (fromKey.currentState.validate()) {
      fromKey.currentState.save();
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ValidateSMSCode(),
          ),
        );
        isAutoValidate = true;
      });
    } else {
      //after input, turn on automatic inspection
    }
  }

  Future<bool> willPop() {
    return showDialog(
        builder: (context) => AlertDialog(
              title: Text('Хотите выйти?'),
              actions: [
                FlatButton(
                  child: Text("Нет"),
                  onPressed: () => Navigator.pop(context, false),
                ),
                FlatButton(
                  child: Text("Да"),
                  onPressed: () => Navigator.pop(context, true),
                )
              ],
            ),
        context: context);
  }
}
