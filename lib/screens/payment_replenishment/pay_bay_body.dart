import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../constant.dart';

class PayBayBody extends StatelessWidget {
  final String textCard;
  final String iconUrl;
  final Icon icon;
  final onTab;

  const PayBayBody({Key key, this.textCard, this.iconUrl, this.icon, this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(iconUrl),
          title: Text(
            textCard,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontFamily: kTextFontFamily),
          ),
          trailing: icon,
          onTap: onTab,
        ),
        Divider(
          indent: 20,
          endIndent: 20,
          height: 15,
          color: Colors.grey,
        ),
      ],
    );
  }
}
