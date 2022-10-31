import 'package:flutter/material.dart';
import 'package:sosomobile/models/TicketModel.dart';
import 'package:sosomobile/views/TicketDetailScreen.dart';

tagColor(criticalityName) {
  Color color = Color(0xff6ae792);
  if (criticalityName == "P5") {
    color = Colors.grey;
  } else if (criticalityName == "P4") {
    color = Color(0xff2196f3);
  } else if (criticalityName == "P3") {
    color = Color(0xffc0ca33);
  } else if (criticalityName == "P2") {
    color = Color(0xffffeb3b);
  } else if (criticalityName == "P1") {
    color = Color(0xffd32f2f);
  }
  return color;
}

statusIcon(status) {
  Icon icon = const Icon(
    Icons.assignment_turned_in_outlined,
    color: Colors.green,
  );
  if (status == "acknowledged") {
    icon = const Icon(
      Icons.av_timer_rounded,
      color: Colors.yellow,
    );
  } else if (status == "triggered") {
    icon = const Icon(
      Icons.assignment_late_outlined,
      color: Colors.red,
    );
  }
  return icon;
}

RoundedRectangleBorder shape = RoundedRectangleBorder(
  side: BorderSide(
    width: 1.2,
    color: Colors.grey.shade300,
  ),
  borderRadius: BorderRadius.circular(8),
);

Widget ticketItemListv2(List<TicketModel> news) {
  myListTile(context, newsModel) {
    var ticketId = newsModel.id;
    var txtTitle = Text(newsModel.problemName);
    var txtSubtitle = Text(
      // 'TICKET ID: ${ticketId}',
      newsModel.description,
      style: const TextStyle(fontSize: 10.0),
    );
    var txtLeading = CircleAvatar(
      backgroundColor: tagColor(newsModel.criticalityName),
      child: Text(
        newsModel.criticalityName,
        style: const TextStyle(color: Colors.white),
      ),
    );
    var iconTrailing = statusIcon(newsModel.status);
    void _TicketDetailScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => TicketDetailScreen(id: newsModel.id)),
      );
    }

    return ListTile(
      shape: shape,
      title: txtTitle,
      leading: txtLeading,
      subtitle: txtSubtitle,
      trailing: iconTrailing,
      onTap: _TicketDetailScreen,
    );
  }

  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: news.length,
    itemBuilder: (context, index) {
      TicketModel newsModel = news[index];
      return myListTile(context, newsModel);
    },
  );
}
