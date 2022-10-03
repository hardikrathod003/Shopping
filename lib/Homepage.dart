import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shopping/CartPage.dart';
import 'package:shopping/Product_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    const Product_page(),
    const Cart_page(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("E-commerce App"),
          centerTitle: true,
        ),
        body: Center(
          child: _tabs[_selectedIndex],
        ),
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          showElevation: true,
          items: [
            FlashyTabBarItem(
              icon: Icon(Icons.home),
              title: Text("Products"),
            ),
            FlashyTabBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("cart"),
            ),
          ],
        ),
      ),
    );
  }
}
