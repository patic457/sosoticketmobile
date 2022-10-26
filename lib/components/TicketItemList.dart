import 'package:flutter/material.dart';
import 'package:sosomobile/models/TicketModel.dart';
import 'package:sosomobile/services/TicketApi.dart';

Widget ticketItemList(var ticket) {
  var itemCount = ticket.length;
  var txtProblemName = ticket.problemName;
  var myListTile = ListTile(
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 1.2,
        color: Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    leading: const CircleAvatar(
      backgroundColor: Color(0xff6ae792),
      child: Text('T', style: TextStyle(color: Colors.black)),
    ),
    subtitle: Text(txtProblemName),
    trailing: const Icon(Icons.more_vert),
  );
  var listView = ListView.builder(
    itemCount: itemCount,
    itemBuilder: (BuildContext context, int index) {
      return Padding(
          padding: const EdgeInsets.only(left: 3, top: 5, bottom: 1, right: 3),
          child: Container(
            child: myListTile,
          ));
    },
  );
  var noListView = const Center(child: Text('No items'));
  return itemCount > 0 ? listView : noListView;
}


// var ticketListView = FutureBuilder(
//       future: ticketList,
//       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//         if (snapshot.hasError) {
//           return const Center(
//             child: Text('มีข้อผิดพลาดในการโหลดข้อมูล'),
//           );
//         } else if (snapshot.connectionState == ConnectionState.done) {
//           //แสดงข้อมูลที่อ่านได้
//           List<TicketModel> list = snapshot.data;
//           // print("List : " + list.toString());
//           return TicketItemList(list);
//           //อะไรที่โหลดจาก api ใช้ ListView.builder
//         } else {
//           // แสดง loading ..
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );