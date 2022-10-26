import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sosomobile/models/TicketModel.dart';
import 'package:sosomobile/views/CreateTicketScreen.dart';
import 'package:sosomobile/views/DashboardScreen.dart';
import 'package:sosomobile/views/MyHomeScreen.dart';
import 'package:sosomobile/views/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

String title = 'Soso ticket Tool';

List<GoRoute> goRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const MyHomeScreen(title: 'Soso Ticket Tool'),
    routes: <GoRoute>[
      GoRoute(
        path: 'myhome',
        builder: (context, state) =>
            const MyHomeScreen(title: 'Soso Ticket Tool'),
      ),
      GoRoute(
        path: 'createTicket',
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: CreateTicketScreen(),
        ),
      ),
      GoRoute(
        path: 'ticketDetail',
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: CreateTicketScreen(),
        ),
      ),
      GoRoute(
        path: 'login',
        pageBuilder: (context, state) => MaterialPage(
          fullscreenDialog: true,
          child: SplashScreen(),
        ),
      ),
    ],
  ),
];

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: goRoutes,
);

var themeData = ThemeData(
  primarySwatch: Colors.blue,
);

MaterialApp materialApp = MaterialApp.router(
  routerConfig: router,
  title: title,
  theme: themeData,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
