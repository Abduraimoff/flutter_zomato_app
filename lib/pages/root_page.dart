import 'package:flutter/material.dart';
import 'package:zomato_app/data/icons_data.dart';
import 'package:zomato_app/pages/cart_page.dart';
import 'package:zomato_app/pages/home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  List pages = const [
    HomePage(),
    Center(child: Text('Go Out')),
    Center(child: Text('Pro')),
    CartPage(),
    Center(child: Text('Nutrition')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex], bottomNavigationBar: getBottomNavBar());
  }

  Widget getBottomNavBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(.7),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (index) {
            return IconButton(
              splashRadius: 1,
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              icon: _selectedIndex == index
                  ? icons[index]['active']
                  : icons[index]['inactive'],
            );
          }),
        ),
      ),
    );
  }
}
