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
    ticketDetailField(detail) => Container(
          child: Column(
            children: [
              Text(
                detail.status,
                style: TextStyle(fontSize: 16.0),
              ),
              Text(detail.criticalityName),
              Text(detail.problemCategoryName),
              Text(detail.problemName),
              Text(detail.description),
              Text(detail.teamId),
              Text(detail.dueDate),
              Text(detail.createdAt),
              Text(detail.createdBy),
              Text(detail.updatedAt),
              Text(detail.updatedBy),
            ],
          ),
        );

    Container ticketDetailWidget = Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
      ),
    );

    return FutureBuilder(
      future: getTicketDetail,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          TicketModel detail = snapshot.data;
          return ticketDetailWidget;
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
