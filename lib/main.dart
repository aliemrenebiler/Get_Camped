import 'package:flutter/material.dart';
import 'screens/loginscreen.dart';
import 'screens/adminscreen.dart';
import 'screens/userscreen.dart';

void main() {
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
      initialRoute: '/homescreen',
      routes: {
        '/homescreen': (context) => const LoginScreen(),
        '/storyscreen': (context) => const UserScreen(),
        '/choosescreen': (context) => const AdminScreen(),
      },
    );
  }
}
