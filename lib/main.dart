import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/allscreens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
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
