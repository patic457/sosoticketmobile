import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
    void _back() {
      Navigator.pop(context);
    }

    Container ticketscreen = Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TicketDetailWidget(id: widget.id),
          ],
        ),
      ),
    );
    var body = ticketscreen;
    var icon = const Icon(Icons.arrow_back_ios, color: Colors.white);
    var appbar = AppBar(
      backgroundColor: const Color(0xffb73c23a),
      leading: Visibility(
        visible: true,
        child: IconButton(
          icon: icon,
          onPressed: _back,
        ),
      ),
      title: Text('Ticket Detail'),
      centerTitle: true,
    );
    Widget scaffold = Scaffold(
      appBar: appbar,
      body: body,
    );
    return scaffold;
  }
}
