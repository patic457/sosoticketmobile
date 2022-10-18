import 'package:flutter/material.dart';
import 'package:sosomobile/services/PagerDutyApi.dart';

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

    PagerDutyApi().getLists();
  }

  @override
  Widget build(BuildContext context) {
    var itemCount = 5;
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
      // title: Text('Item' + itemCount.toString()),
      subtitle: const Text('Item Ticket'),
      trailing: const Icon(Icons.more_vert),
    );

    var myListView = ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding:
                const EdgeInsets.only(left: 3, top: 5, bottom: 1, right: 3),
            child: Container(
              child: myListTile,
            ));
      },
    );

    var noListView = const Center(child: Text('No items'));

    return itemCount > 0 ? myListView : noListView;
  }
}
