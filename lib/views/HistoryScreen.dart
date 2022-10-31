import 'package:flutter/material.dart';
import 'package:sosomobile/components/TicketListWidget.dart';

class HistoryScreen extends StatefulWidget {
  @override
  State<HistoryScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const TicketListWidget(listviewWidget: 'history');
  }
}
