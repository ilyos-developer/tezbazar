import 'package:flutter/material.dart';

import '../../../constant.dart';

class OrederCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.positive-market.ru/f/store/offers/cmof4m2adlikas2x.jpg'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 12),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              width: size.width * 0.70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Овсяная крупа “Геркулес” вторая строчка Овсяная крупа “Геркулес” вторая строчка',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: kTextFontFamily,
                    ),
                  ),
                  SizedBox(height: 9),
                  Text(
                    '400 г',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: kTextFontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          indent: 100,
          endIndent: 20,
          height: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
