import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class floatingActionButtonWidget extends StatefulWidget {
  floatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  State<floatingActionButtonWidget> createState() => _nameState();
}

class _nameState extends State<floatingActionButtonWidget> {
  void _createTicket() {
    Navigator.pushNamed(context, '/create');
  }

  @override
  Widget build(BuildContext context) {
    Widget floatingActionButton = FloatingActionButton.large(
      backgroundColor: Colors.green[900],
      child: const Icon(FontAwesomeIcons.plus),
      onPressed: _createTicket,
    );
    return floatingActionButton;
  }
}
