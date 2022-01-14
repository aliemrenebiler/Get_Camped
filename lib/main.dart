import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postgres/postgres.dart';

import 'database/allvariables.dart';
import 'screens/loginscreen.dart';
import 'screens/adminscreen.dart';
import 'screens/userscreen.dart';

// Admin Pages
import 'screens/adminpages/mngcampsscreen.dart';
import 'screens/adminpages/mngrsvsscreen.dart';
import 'screens/adminpages/mngusersscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
  await connection.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetCamped',
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      initialRoute: '/loginscreen',
      routes: {
        '/loginscreen': (context) => const LoginScreen(),
        '/userscreen': (context) => const UserScreen(),
        '/adminscreen': (context) => const AdminScreen(),

        // admin panel routes
        '/mngusersscreen': (context) => const MngUsersScreen(),
        '/mngcampsscreen': (context) => const MngCampsScreen(),
      },
    );
  }
}
