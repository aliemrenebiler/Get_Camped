import 'package:flutter/material.dart';
import '../../database/allclasses.dart';
import '../../database/allvariables.dart';

class MngUsersScreen extends StatefulWidget {
  const MngUsersScreen({Key? key}) : super(key: key);

  @override
  State<MngUsersScreen> createState() => _MngUsersScreenState();
}

class _MngUsersScreenState extends State<MngUsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kullanıcıları Yönet',
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
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              UserSearchBarBox(),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // BURADA ARAMA SONUÇLARI OLACAK!
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserSearchBarBox extends StatelessWidget {
  UserSearchBarBox({Key? key}) : super(key: key);
  var searchedUsername = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              child: TextFormField(
                controller: searchedUsername,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "TC Kimlik No",
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // ARAMA YAP
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(minWidth: 100),
              child: const Text(
                'Ara',
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
          )
        ],
      ),
    );
  }
}
