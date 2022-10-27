import 'package:flutter/material.dart';
import 'package:sosomobile/models/TicketModel.dart';
import 'package:sosomobile/services/TicketApi.dart';

class TicketDetailWidget extends StatefulWidget {
  final String? text;
  final String id;

  const TicketDetailWidget({
    Key? key,
    this.text,
    required this.id,
  }) : super(key: key);

  @override
  State<TicketDetailWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TicketDetailWidget> {
  @override
  Widget build(BuildContext context) {
    var getTicketDetail = TicketApi().getTicket(widget.id);
    var txt = widget.text ?? '';
    return FutureBuilder(
      future: getTicketDetail,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          TicketModel detail = snapshot.data;

          return Text(detail.status);
        } else {
          return const Center(child: Text('Loading...'));
        }
      },
    );
  }
}
