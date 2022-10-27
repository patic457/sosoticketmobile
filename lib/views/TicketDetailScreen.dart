import 'package:flutter/material.dart';
import 'package:sosomobile/components/AppBarWidget.dart';
import 'package:sosomobile/components/TicketDetailWidget.dart';

class TicketDetailScreen extends StatefulWidget {
  final String? text;
  final String id;

  const TicketDetailScreen({
    Key? key,
    this.text,
    required this.id,
  }) : super(key: key);

  @override
  State<TicketDetailScreen> createState() => _DetailScreenScreenState();
}

class _DetailScreenScreenState extends State<TicketDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var appbar = const AppBarWidget(title: 'Create Ticket', menu: '/myhome');
    var body = TicketDetailWidget(id: widget.id);

    Widget scaffold = Scaffold(
      appBar: appbar,
      body: body,
    );
    return scaffold;
  }
}
