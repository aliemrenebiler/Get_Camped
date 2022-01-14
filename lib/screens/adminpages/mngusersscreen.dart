import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:get_camped/database/allmethods.dart';
import '../../database/allclasses.dart';
import '../../database/allvariables.dart';

class MngUsersScreen extends StatefulWidget {
  const MngUsersScreen({Key? key}) : super(key: key);

  @override
  State<MngUsersScreen> createState() => _MngUsersScreenState();
}

class _MngUsersScreenState extends State<MngUsersScreen> {
  refresh() {
    setState(() {});
  }

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
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              SearchBarBox(notifyParent: refresh),
              Row(
                children: [
                  Expanded(
                    child: ListAllButton(notifyParent: refresh),
                  ),
                  const Expanded(
                    child: AddUserButton(),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    UserBox(user: currentUser),
                    UserBox(user: currentUser),
                    UserBox(user: currentUser),
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

class SearchBarBox extends StatelessWidget {
  final Function() notifyParent;
  SearchBarBox({Key? key, required this.notifyParent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 8),
            child: TextFormField(
              controller: ssnController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "TC Kimlik No",
              ),
            ),
          ),
        ),
        Container(
          child: FittedBox(
            child: InkWell(
              onTap: () {
                // ARAMA YAP  <=================
              },
              child: Container(
                alignment: Alignment.center,
                width: 70,
                height: 50,
                child: const Text(
                  'Ara',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
          margin: const EdgeInsets.all(5),
        ),
      ],
    );
  }
}

class UserBox extends StatelessWidget {
  final User user;
  const UserBox({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 15),
            child: Column(
              children: [
                Text(
                  'TC: ' + user.ssn!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 20,
                  ),
                ),
                Text(
                  user.name! + ' ' + user.surname!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Telefon: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 22,
                  ),
                ),
                Text(
                  user.phone!,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'HES Kodu: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 22,
                  ),
                ),
                Text(
                  user.hesCode!,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: EditUserBox(user: currentUser),
                            contentPadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      height: 50,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const DeleteUserBox(),
                            contentPadding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}

// FUNCTION BOXES
class AddUserBox extends StatelessWidget {
  const AddUserBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 2 / 3,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Yeni Kullanıcı Bilgileri',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "TC Kimlik No",
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "İsim",
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Soyisim",
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Telefon",
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "HES Kodu",
                  ),
                ),
              ),
            ),
            Container(
              child: InkWell(
                onTap: () {
                  // KULLANICI EKLE  <=================
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: const UserAddedBox(),
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 150,
                  child: const Text(
                    'Kaydet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(5),
            ),
          ],
        ),
      ),
    );
  }
}

class EditUserBox extends StatelessWidget {
  final User user;
  const EditUserBox({Key? key, required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width / 3,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Yeni Kullanıcı Bilgileri',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Şuanki İsim',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          user.name!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(left: 25, bottom: 15),
                      child: TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Yeni İsim",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Şuanki Soyisim',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          user.surname!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(left: 25, bottom: 15),
                      child: TextFormField(
                        controller: surnameController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Yeni Soyisim",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Şuanki Telefon',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          user.phone!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(left: 25, bottom: 15),
                      child: TextFormField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Yeni Telefon",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Şuanki HES Kodu',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          user.hesCode!,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.only(left: 25, bottom: 15),
                      child: TextFormField(
                        controller: hesCodeController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Yeni HES Kodu",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                // KULLANICI GÜNCELLE <====================
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: UserUpdatedBox(),
                      contentPadding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  'Kaydet',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteUserBox extends StatelessWidget {
  const DeleteUserBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width / 3,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Bu kullanıcıyı silmek\nistediğinize emin misiniz?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        'Hayır',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      // KULLANICIYI SİL <=====================
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        'Evet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// INFORMATION BOXES
class UserAddedBox extends StatelessWidget {
  const UserAddedBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Kullanıcı başarıyla eklendi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  'Tamam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserUpdatedBox extends StatelessWidget {
  const UserUpdatedBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: const Text(
                'Kullanıcı bilgileri güncellendi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: 200,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  'Tamam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// BUTTONS
class ListAllButton extends StatelessWidget {
  final Function() notifyParent;
  const ListAllButton({Key? key, required this.notifyParent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () async {
          //await connection.open();

          //searchedList = await connection.query('''
          //SELECT * FROM users
          //''');

          //row = searchedList[0];

          //print('YAZI');
          //await connection.close();

          notifyParent();
        },
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          alignment: Alignment.center,
          height: 50,
          child: const Text(
            'Tüm Kullanıcılar',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      margin: const EdgeInsets.all(5),
    );
  }
}

class AddUserButton extends StatelessWidget {
  const AddUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddUserBox(),
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          child: const Text(
            'Kullanıcı Ekle',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
      margin: const EdgeInsets.all(5),
    );
  }
}
