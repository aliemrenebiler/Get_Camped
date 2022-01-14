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
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AdminInfoBox(
                user: currentUser,
              ),
              const ManageUsersButton(),
              const ManageCampsButton(),
              const ManageRsvsButton(),
            ],
          ),
        ),
      ),
    );
  }
}

// Admin Bilgileri
class AdminInfoBox extends StatelessWidget {
  final User user;
  const AdminInfoBox({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 20, 5, 20),
      child: (user.name != null && user.surname != null)
          ? Column(
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
                  user.name! + ' ' + user.surname!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ],
            )
          : const Text(
              '(İsim Mevcut Değil)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
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
        Navigator.pushNamed(context, '/mngusersscreen');
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
        Navigator.pushNamed(context, '/mngcampsscreen');
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
