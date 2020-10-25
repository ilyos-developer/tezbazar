import 'package:flutter/material.dart';
import 'package:tezbazar/constant.dart';
import 'package:tezbazar/screens/home/home_screen.dart';

class SuccessPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Icon(
                    Icons.check_circle_outline,
                    size: 150,
                    color: Colors.green,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Платёж проведён успешно!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: kTextFontFamily,
                        fontSize: 18),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Ваш заказ прибудет \nв указанное время!",
                    style: TextStyle(fontFamily: kTextFontFamily, fontSize: 18),
                  ),
                  SizedBox(height: 100),
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
                      "Продолжить",
                      style: TextStyle(color: kTextColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
