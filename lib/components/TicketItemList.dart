import 'package:flutter/material.dart';
import 'package:sosomobile/models/TicketModel.dart';

Widget TicketItemList(List<TicketModel> news) {
  // return List<NewsModel> news = snapshot.data;
  return ListView.builder(
    scrollDirection: Axis.vertical,
    itemCount: news.length,
    itemBuilder: (context, index) {
      TicketModel newsModel = news[index];

      return ListTile(
        // leading: Image.network(newsModel.imageurl),
        title: Text(
          newsModel.id,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          newsModel.description,
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
    },
  );
}
