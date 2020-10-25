import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/constant.dart';
import 'package:tezbazar/screens/profile/profile_screen.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final fromKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  var name;
  var tel;
  var email;
  var address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Редактирование"),
      ),
      body: ListView(
        children: [
          Container(
            child: Form(
              key: fromKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: "Имя"),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Пожалуйста введите Имя";
                        }
                        return null;
                      },
                      onSaved: (value) => name = value.trim(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Электронная почта"),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(value.trim())) {
                          return "Недействительный адрес электронной почты";
                        }
                        return null;
                      },
                      onSaved: (value) => email = value.trim(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: "Адрес(основной)"),
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
        ],
      ),
      bottomNavigationBar: Row(children: <Widget>[
        Expanded(
          child: RaisedButton(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePageScreen(),
                ),
              );
            },
            child: Text(
              "Отменить",
              style: TextStyle(color: kTextColor),
            ),
          ),
        ),
        Expanded(
          child: RaisedButton(
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
        ),
      ]),
    );
  }

  void validateInputs() {
    if (fromKey.currentState.validate()) {
      fromKey.currentState.save();
      print(name);
      print(tel);
      print(email);
      print(address);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePageScreen(),
          ),
        );
        isAutoValidate = true;
      });
    } else {
      //after input, turn on automatic inspection
    }
  }
}
