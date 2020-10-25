import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezbazar/screens/registration_login/success_reg_page.dart';

import '../../constant.dart';

class PersonDate extends StatefulWidget {
  @override
  _PersonDateState createState() => _PersonDateState();
}

class _PersonDateState extends State<PersonDate> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController dateCtl = TextEditingController();
  bool isAutoValidate = false;
  var name;
  var bDay;
  var gender;
  var email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Личные данный"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: fromKey,
              autovalidate: isAutoValidate,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Имя"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Пожалуйста введите Имя";
                      }
                      return null;
                    },
                    onSaved: (value) => name = value,
                  ),
                  TextFormField(
                    controller: dateCtl,
                    decoration: InputDecoration(
                      labelText: "Дата рождения",
                      hintText: "Выберите дату рождения",
                    ),
                    onTap: () async {
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      dateCtl.text = date.toIso8601String();
                    },
                    onSaved: (value) => bDay = value,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Пол"),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Выберите пол";
                      }
                      return null;
                    },
                    onSaved: (value) => gender = value,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Электронная почта"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      Pattern pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regex = new RegExp(pattern);
                      if (!regex.hasMatch(value)) {
                        return "Недействительный адрес электронной почты";
                      }
                      return null;
                    },
                    onSaved: (value) => email = value,
                  ),
                  SizedBox(height: 380),
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
            builder: (context) => SuccessRegScreen(),
          ),
        );
        isAutoValidate = true;
      });
    } else {
      //after input, turn on automatic inspection
    }
  }
}
