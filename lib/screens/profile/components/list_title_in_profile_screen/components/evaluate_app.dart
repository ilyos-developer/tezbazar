import 'package:flutter/material.dart';

class EvaluateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Оценить приложение"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Text("Помогите нам улучшить приложение! Оставьте свой отзыв в магазине приложений, и поставьте ему оценку!", textAlign: TextAlign.center,),
      ),
    );
  }
}
