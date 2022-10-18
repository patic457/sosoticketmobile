import 'package:flutter/material.dart';

class TicketDetailWidget extends StatefulWidget {
  final String? text;

  const TicketDetailWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  State<TicketDetailWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TicketDetailWidget> {
  @override
  Widget build(BuildContext context) {
    var txt = widget.text ?? '';
    return Container(
      child: Column(
        children: [Text(txt)],
      ),
    );
  }
}
