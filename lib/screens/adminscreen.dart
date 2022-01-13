import 'package:flutter/material.dart';
import '../database/allclasses.dart';
import '../database/allvariables.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Admin Paneli',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              AdminInfoBox(
                currentUser: user,
              ),
              ManageUsersButton(),
              ManageCampsButton(),
              ManageRsvsButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// Admin Bilgileri
class AdminInfoBox extends StatelessWidget {
  final User currentUser;
  const AdminInfoBox({Key? key, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: Column(
        children: [
          const Text(
            'Hoşgeldin',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 25,
            ),
          ),
          Text(
            currentUser.name! + ' ' + currentUser.surname!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}

// Butonlar
class ManageUsersButton extends StatelessWidget {
  const ManageUsersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.all(5),
        child: const Text(
          'Kullanıcıları Yönet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}

class ManageCampsButton extends StatelessWidget {
  const ManageCampsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.all(5),
        child: const Text(
          'Kamp Alanlarını Yönet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}

class ManageRsvsButton extends StatelessWidget {
  const ManageRsvsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        margin: const EdgeInsets.all(5),
        child: const Text(
          'Rezervasyonları Yönet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
