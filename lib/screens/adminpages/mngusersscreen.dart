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
                    //for (var x in searchedList) {},
                    UserEditBox(
                        ssn: 'tc', name: 'Sıla Nursu', surname: 'Yücel'),
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
  var ssnController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 5),
              child: TextFormField(
                controller: ssnController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "TC Kimlik No",
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // ARAMA YAP  <=================
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
          ),
          InkWell(
            onTap: () {
              // TÜM KULLANICILARI LİSTELE  <=================
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(minWidth: 250),
              child: const Text(
                'Tüm Kullanıcıları Listele',
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
          ),
          InkWell(
            onTap: () {
              // KULLANICI EKLE  <=================
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(minWidth: 200),
              child: const Text(
                'Kullanıcı Ekle',
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
          ),
        ],
      ),
    );
  }
}

class UserEditBox extends StatelessWidget {
  String ssn;
  String name;
  String surname;
  UserEditBox(
      {Key? key, required this.ssn, required this.name, required this.surname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ssn,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    name + ' ' + surname,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // DÜZENLE <=================
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(maxWidth: 200),
              child: const Text(
                'Düzenle',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // SİL <=================
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              margin: const EdgeInsets.all(5),
              constraints: const BoxConstraints(maxWidth: 100),
              child: const Text(
                'Sil',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
