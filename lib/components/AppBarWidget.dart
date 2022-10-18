import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);

  final bool isActive;
  final Color? color;
  final String title;
  final String? menu;

  const AppBarWidget({
    Key? key,
    this.isActive = true,
    this.color,
    required this.title,
    this.menu = 'home',
  }) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppState();
}

class _AppState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    var menu = widget.menu;
    var visible = menu == 'home' ? false : true;
    void onPressed() => menu == 'home' ? {} : context.go(menu.toString());
    var icon = menu == 'home'
        ? const Icon(Icons.menu_outlined, color: Colors.white)
        : const Icon(Icons.arrow_back_ios, color: Colors.white);
    Color color =
        menu == 'home' ? const Color(0xFF25584F) : const Color(0xffb73c23a);

    return PreferredSize(
      preferredSize: Size.fromWidth(MediaQuery.of(context).size.width),
      child: AppBar(
        backgroundColor: color,
        leading: Visibility(
          visible: visible,
          child: IconButton(
            icon: icon,
            onPressed: onPressed,
          ),
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
    );
  }
}
