import 'package:flutter/material.dart';
import 'package:dropdown_plus/dropdown_plus.dart';

final createTicketController = TextEditingController();
var cateItems = ["AIS Fiber", "AIS PLAY", "AIS Store"];
var dropdownvalue = 'AIS Fiber';

class DropdownCategoryWidget extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onChanged;

  const DropdownCategoryWidget({
    Key? key,
    required this.text,
    this.isActive = true,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextDropdownFormField(
      onSaved: (dynamic str) {},
      onChanged: (value) => onChanged(),
      validator: (dynamic str) {},
      options: cateItems,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.arrow_drop_down),
        labelText: 'cate',
      ),
    );
  }
}
