import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final List<BottomNavigationBarItem>? items;
  final int selectedIndex;
  final bool isActive;
  final Color? color;
  final IconButton? iconButton;
  final onTap;

  const BottomNavigationBarWidget({
    Key? key,
    this.items,
    this.selectedIndex = 0,
    this.isActive = true,
    this.color,
    this.iconButton,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _AppState();
}

class _AppState extends State<BottomNavigationBarWidget> {
  void _onItemTapped(int index) {}

  final List<BottomNavigationBarItem> menuBar = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.house),
      label: 'Home',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(FontAwesomeIcons.productHunt),
    //   label: 'Dispatcher',
    // ),
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.clock),
      label: 'History',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget bottomNavigationBar = BottomNavigationBar(
      items: menuBar,
      currentIndex: widget.selectedIndex,
      elevation: 4.0,
      selectedItemColor: Colors.green,
      unselectedItemColor: const Color(0xFF9D9D9D),
      onTap: _onItemTapped,
    );
    return bottomNavigationBar;
  }
}
