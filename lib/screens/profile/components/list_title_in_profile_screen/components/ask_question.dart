import 'package:flutter/material.dart';
import 'package:tezbazar/screens/profile/profile_screen.dart';

import '../../../../../constant.dart';

class AskQuestion extends StatefulWidget {
  @override
  _AskQuestionState createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestion> {
  final fromKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  var theme;
  var text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Задать вопрось"),
        ),
        body: ListView(
          children: [
            Container(
              child: Form(
                key: fromKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        decoration:
                        const InputDecoration(labelText: "Тема"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Пожалуйста введите названия темы";
                          }
                          return null;
                        },
                        onSaved: (value) => theme = value,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        maxLines: 5,
                        decoration: const InputDecoration(
                            labelText: "Текст обращения"),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Пожалуйста введите ваше обращения";
                          }
                          return null;
                        },
                        onSaved: (value) => text = value,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: RaisedButton(
          color: Colors.green,
          onPressed: () {
            validateInputs();
          },
          child: Text(
            "Отправить",
            style: TextStyle(color: kTextColor),
          ),
        ),
    );
  }

  void validateInputs() {
    if (fromKey.currentState.validate()) {
      fromKey.currentState.save();
      print(text);
      print(theme);
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
