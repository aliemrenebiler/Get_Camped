import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/userscreen');
                },
                child: const Text('USER PAGE'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adminscreen');
                },
                child: const Text('ADMIN PAGE'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
