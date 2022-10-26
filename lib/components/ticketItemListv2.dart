import 'package:flutter/material.dart';
import 'package:sosomobile/models/TicketModel.dart';
import 'package:sosomobile/views/CreateTicketScreen.dart';

tagColor(criticalityName) {
  Color color = Color(0xff6ae792);
  if (criticalityName == "P4") {
    color = Colors.yellow.shade500;
  } else if (criticalityName == "P1") {
    color = Colors.red;
  }

  return color;
}

Widget ticketItemListv2(List<TicketModel> news) {
  myListTile(context, newsModel) {
    void _ticketDetail() {
      // context.go('/createTicket');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateTicketScreen()),
      );
      // arguments: {'id': newsModel.id},
    }

    void _createTicket() {
      context.go('/createTicket');
    }

    return ListTile(
      title: Text(newsModel.problemName),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.2,
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      leading: CircleAvatar(
        backgroundColor: tagColor(newsModel.criticalityName),
        child: Text(
          newsModel.criticalityName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      subtitle: Text('TICKET ID: ' + newsModel.id),
      // trailing: const Icon(Icons.more_vert),
      onTap: _ticketDetail,
    );
  }

  myListTilev1(context, newsModel) => ListTile(
        title: Text(
          newsModel.id,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          newsModel.problemName,
          overflow: TextOverflow.ellipsis,
        ),
        onTap: () {
          // print(index);
          //ส่งไปที่หน้า news detail
          Navigator.pushNamed(context, '/newsdetail',
              arguments: {'id': newsModel.id});
          //argument -> ตัวที่เราจะฝากไปอีกหน้านึงในรูปแบบ object json
        },
      );

  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: news.length,
    itemBuilder: (context, index) {
      TicketModel newsModel = news[index];
      return myListTile(context, newsModel);
    },
  );
}
