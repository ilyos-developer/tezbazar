import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tezbazar/screens/catalog/catalog_screen.dart';
import 'package:tezbazar/screens/cart/cart_screen.dart';
import 'package:tezbazar/screens/profile/profile_screen.dart';

import 'home_screen.dart';

class NestedHomePage extends StatefulWidget {
  @override
  _NestedHomePageState createState() => _NestedHomePageState();
}

class _NestedHomePageState extends State<NestedHomePage> {
  List<GlobalKey<NavigatorState>> _navigatorKeys;
  int _currentIndex = 0;

  final _homeScreen = GlobalKey<NavigatorState>();
  final _catalogScreen = GlobalKey<NavigatorState>();
  final _searchScreen = GlobalKey<NavigatorState>();
  final _cartScreen = GlobalKey<NavigatorState>();
  final _profileScreen = GlobalKey<NavigatorState>();

  void initState() {
    super.initState();
    _navigatorKeys = [
      _homeScreen,
      _catalogScreen,
      _searchScreen,
      _cartScreen,
      _profileScreen,
    ];
  }

  Future<bool> _systemBackButtonPressed() {
    if (_navigatorKeys[_currentIndex].currentState.canPop()) {
      _navigatorKeys[_currentIndex]
          .currentState
          .pop(_navigatorKeys[_currentIndex].currentContext);
    }
    else {
      SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _systemBackButtonPressed,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            Navigator(
              key: _homeScreen,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => HomeScreen(),
              ),
            ),
            Navigator(
              key: _catalogScreen,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => CatalogScreen(),
              ),
            ),
            Navigator(
              key: _searchScreen,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => HomeScreen(),
              ),
            ),
            Navigator(
              key: _cartScreen,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => CartScreen(),
              ),
            ),
            Navigator(
              key: _profileScreen,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => ProfilePageScreen(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (val) => _onTap(val, context),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              title: Text('Главная'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category, size: 30),
              title: Text('Каталог'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 30),
              title: Text('Поиск'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 30),
              title: Text('Корзина'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 30),
              title: Text('Профиль'),
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int val, BuildContext context) {
    if (_currentIndex == val) {
      switch (val) {
        case 0:
          _homeScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 1:
          _catalogScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 2:
          _searchScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 3:
          _cartScreen.currentState.popUntil((route) => route.isFirst);
          break;
        case 4:
          _profileScreen.currentState.popUntil((route) => route.isFirst);
          break;
        default:
      }
    } else {
      if (mounted) {
        setState(() {
          _currentIndex = val;
        });
      }
    }
  }
}
