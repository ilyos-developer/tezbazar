import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tezbazar/constant.dart';
import 'package:tezbazar/screens/home/home_screen.dart';

class SuccessRegScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 263),
              Text(
                "Поздравляем!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: kTextFontFamily),
              ),
              SizedBox(height: 18),
              Text(
                "Регистрация была успешно \nпройдена!",
                style: TextStyle(fontSize: 14, fontFamily: kTextFontFamily),
              ),
              SizedBox(
                height: 350,
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Text(
                  "Далее",
                  style: TextStyle(color: kTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
