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
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SearchCampsBarBox(),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //for (var x in searchedList) {},
                    ShowCampBox(
                      camp: currentCamp,
                    ),
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

class SearchCampsBarBox extends StatelessWidget {
  const SearchCampsBarBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 5),
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
            constraints: const BoxConstraints(minWidth: 70),
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
              color: Colors.blueAccent,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: AddCampBox(),
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
            margin: const EdgeInsets.all(5),
            constraints: const BoxConstraints(minWidth: 160),
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
      ],
    );
  }
}

class ShowCampBox extends StatelessWidget {
  final Camp camp;
  const ShowCampBox({Key? key, required this.camp}) : super(key: key);

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
                    camp.id!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    camp.name! + ' - ' + camp.city!,
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Telefon:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'camp.tent!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HES Kodu:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    camp.dailyPrice!.toString(),
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: EditCampBox(user: currentUser),
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
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const DeleteCampBox(),
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

class AddCampBox extends StatelessWidget {
  AddCampBox({Key? key}) : super(key: key);
  var newUser = User();
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
            InkWell(
              onTap: () {
                // KULLANICI EKLE  <=================
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const CampAddedBox(),
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

class CampAddedBox extends StatelessWidget {
  const CampAddedBox({Key? key}) : super(key: key);
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

class EditCampBox extends StatelessWidget {
  final User user;
  const EditCampBox({Key? key, required this.user}) : super(key: key);
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
                      content: CampUpdatedBox(),
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

class CampUpdatedBox extends StatelessWidget {
  const CampUpdatedBox({Key? key}) : super(key: key);
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

class DeleteCampBox extends StatelessWidget {
  const DeleteCampBox({Key? key}) : super(key: key);
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
