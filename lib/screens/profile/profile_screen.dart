import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:tezbazar/screens/profile/components/balance.dart';
import 'package:tezbazar/screens/profile/components/favorite.dart';
import 'package:tezbazar/screens/profile/components/history.dart';
import 'package:tezbazar/screens/profile/components/orders.dart';
import 'package:tezbazar/screens/profile/components/points.dart';

import 'components/edit_profile.dart';
import 'components/list_title_in_profile_screen/list_title_items.dart';
import 'components/person_address.dart';

class ProfilePageScreen extends StatefulWidget {
  @override
  _ProfilePageScreenState createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мой профиль"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfile(),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              color: Colors.grey[200],
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PersonAddress(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: 100,
                                  width: 120,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            'assets/images/home.png'),
                                      ),
                                      Text("Адрес"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Balance(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: 100,
                                  width: 120,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            'assets/images/purse.png'),
                                      ),
                                      Text("150 000 сум"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Points(),
                                  ),
                                );
                              },
                              child: Container(
                                color: Colors.white,
                                height: 100,
                                width: 120,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 80,
                                      width: 80,
                                      child: Image.asset(
                                          'assets/images/point.png'),
                                    ),
                                    Text("3 000 поинтов"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Orders(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    height: 100,
                                    width: 120,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          child: Image.asset(
                                              'assets/images/order.png'),
                                        ),
                                        Text("Заказы"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Favorite(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    height: 100,
                                    width: 120,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          child: Image.asset(
                                              'assets/images/favorite.png'),
                                        ),
                                        Text("Избранное"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => History(),
                                    ),
                                  );
                                },
                                child: Container(
                                  color: Colors.white,
                                  height: 100,
                                  width: 120,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                            'assets/images/history.png'),
                                      ),
                                      Text("История"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListTitleItems(),
          ],
        ),
      ),
    );
  }
}
