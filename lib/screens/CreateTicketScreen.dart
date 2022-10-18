import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sosomobile/components/AppBarWidget.dart';
import 'package:sosomobile/components/ButtonWidget.dart';

String someVal = '';
var chosenValue;

class CreateTicketScreen extends StatefulWidget {
  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final List<Map<String, dynamic>> _roles = [
    {"name": "Super Admin", "desc": "Having full access rights", "role": 1},
    {
      "name": "Admin",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Manager",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Technician",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {
      "name": "Customer Support",
      "desc": "Having Customer Support access rights",
      "role": 5
    },
    {"name": "User", "desc": "Having End User access rights", "role": 6},
  ];
  final createTicketController = TextEditingController();
  var cateItems = ["AIS Fiber", "AIS PLAY", "AIS Store"];
  var dropdownvalue = 'AIS Fiber';

  onChangedDropdownCategory(value) {
    setState(() {
      chosenValue = value;
    });
  }

  void _createTicket() {
    // createTicketCallApi();
    // createTicketTextField(createTicketController, chosenValue);
  }

  @override
  Widget build(BuildContext context) {
    var appbar = const AppBarWidget(title: 'Create Ticket', menu: '/myhome');
    var dropdownCategoryField = TextDropdownFormField(
      onSaved: (dynamic str) {},
      onChanged: (value) => onChangedDropdownCategory(value),
      validator: (dynamic str) {},
      options: cateItems,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_drop_down),
        labelText: "Category",
      ),
      // dropdownHeight: 120,
    );

    var textField = TextField(
      autofocus: false,
      controller: createTicketController,
      decoration: const InputDecoration(
        hintText: 'Test Ticket',
        border: OutlineInputBorder(),
        labelText: "Problem",
      ),
    );

    Container createTicketForm = Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            dropdownCategoryField,
            const SizedBox(height: 15),
            textField,
            const SizedBox(height: 20),
            ButtonWidget(
              text: "Create Ticket",
              onPressed: _createTicket,
            ),
          ],
        ),
      ),
    );

    Widget scaffold = Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(child: createTicketForm),
    );

    return scaffold;
  }
}
