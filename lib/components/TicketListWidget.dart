import 'package:flutter/material.dart';
import 'package:sosomobile/components/mockupItemList.dart';
import 'package:sosomobile/components/ticketItemList.dart';
import 'package:sosomobile/components/ticketItemListv2.dart';
import 'package:sosomobile/models/TicketModel.dart';
import 'package:sosomobile/services/TicketApi.dart';

class TicketListWidget extends StatefulWidget {
  final String? text;

  const TicketListWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  State<TicketListWidget> createState() => _nameState();
}

class _nameState extends State<TicketListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myListView = mockupItemList();
    var ticketList = TicketApi().getAllTicket();
    // var ticketListView = ticketItemList(ticketList);

    var ticketListView = FutureBuilder(
      future: ticketList,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('มีข้อผิดพลาดในการโหลดข้อมูล'),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            List<TicketModel> list = snapshot.data;
            return ticketItemListv2(list);
          } else {
            return Container();
          }

          //แสดงข้อมูลที่อ่านได้

          // print("List : " + list.toString());

          //อะไรที่โหลดจาก api ใช้ ListView.builder
        } else {
          // แสดง loading ..
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );

    return ticketListView;
  }
}
