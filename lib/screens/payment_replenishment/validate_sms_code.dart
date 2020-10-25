import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tezbazar/constant.dart';
import 'package:tezbazar/screens/payment_replenishment/success_payment.dart';

class ValidateCode extends StatefulWidget {
  final String appBarTitle;

  ValidateCode({Key key, this.appBarTitle}) : super(key: key);

  @override
  _ValidateCodeState createState() => _ValidateCodeState();
}

class _ValidateCodeState extends State<ValidateCode> {
  final fromKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  var code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
              child: Text(
                "Введите код подтверждения из СМС",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: kTextFontFamily),
              ),
            ),
            Form(
              key: fromKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 100, right: 100, top: 100),
                child: TextFormField(
                  maxLength: 6,
                  decoration: const InputDecoration(labelText: "Код"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.length != 6) {
                      return "Пожалуйста введите код";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    code = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            RaisedButton(
              color: Colors.green,
              onPressed: () {
                validateInputs();
              },
              child: Text(
                "Продолжить",
                style: TextStyle(color: kTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void validateInputs() {
    if (fromKey.currentState.validate()) {
      fromKey.currentState.save();
      print(code);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessPayment(),
          ),
        );
        isAutoValidate = true;
      });
    } else {
      //after input, turn on automatic inspection

    }
  }
}
