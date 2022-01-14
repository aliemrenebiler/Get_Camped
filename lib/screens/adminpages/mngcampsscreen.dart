import 'package:flutter/material.dart';
import '../../database/allclasses.dart';
import '../../database/allvariables.dart';

class MngCampsScreen extends StatefulWidget {
  const MngCampsScreen({Key? key}) : super(key: key);

  @override
  State<MngCampsScreen> createState() => _MngCampsScreenState();
}

class _MngCampsScreenState extends State<MngCampsScreen> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kamp Alanlarını Yönet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
