import 'package:flutter/material.dart';
import '../../database/allmethods.dart';
import '../../database/allvariables.dart';
import '../../database/theme.dart';

class UsersRsvScreen extends StatefulWidget {
  const UsersRsvScreen({Key? key}) : super(key: key);

  @override
  State<UsersRsvScreen> createState() => _UsersRsvScreenState();
}

class _UsersRsvScreenState extends State<UsersRsvScreen> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kullanıcıları Yönet',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSizeL,
          ),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            SearchUserBox(notifyParent: refresh),
            Row(
              children: [
                // Expanded(
                //   child: ListAllButton(notifyParent: refresh),
                // ),
                Expanded(
                  child: AddRsvButton(notifyParent: refresh),
                )
              ],
            ),
            (searchedList != null)
                ? Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        for (var x in searchedList)
                          UserBox(
                            ssn: x[0] ?? '--',
                            name: x[1] ?? '--',
                            surname: x[2] ?? '--',
                            phone: x[3] ?? '--',
                            hesCode: x[4] ?? '--',
                            notifyParent: refresh,
                          ),
                      ],
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.fromLTRB(5, 30, 5, 30),
                    child: Text(
                      'Gösterilecek bir veri yok.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: fontSizeM,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

// TOP BUTTONS AND SEARCH
class SearchUserBox extends StatelessWidget {
  final Function() notifyParent;
  SearchUserBox({Key? key, required this.notifyParent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: FittedBox(
            child: InkWell(
              onTap: () async {
                await getSingleUser(currentUser.ssn!);
                await clearAllControllers();
                notifyParent();
              },
              child: Container(
                alignment: Alignment.center,
                width: 70,
                height: 50,
                child: Text(
                  'Rezervasyon Görüntüle',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeM,
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

class AddRsvButton extends StatelessWidget {
  final Function() notifyParent;
  const AddRsvButton({Key? key, required this.notifyParent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: AddRsvBox(notifyParent: notifyParent),
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
          child: Text(
            'Rezervasyon Ekle',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeM,
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

// REPEATED USER BOX
class UserBox extends StatelessWidget {
  final String ssn;
  final String name;
  final String surname;
  final String phone;
  final String hesCode;
  final Function() notifyParent;
  const UserBox({
    Key? key,
    required this.ssn,
    required this.name,
    required this.surname,
    required this.phone,
    required this.hesCode,
    required this.notifyParent,
  }) : super(key: key);

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
                  'TC: ' + ssn,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: fontSizeS,
                  ),
                ),
                Text(
                  name + ' ' + surname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeL,
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
                Text(
                  'Telefon: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: fontSizeM,
                  ),
                ),
                Text(
                  phone,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeM,
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
                Text(
                  'HES Kodu: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: fontSizeM,
                  ),
                ),
                Text(
                  hesCode,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeM,
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
                            content: EditRsvBox(
                              ssn: ssn,
                              name: name,
                              surname: surname,
                              phone: phone,
                              hesCode: hesCode,
                              notifyParent: notifyParent,
                            ),
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
                      child: Text(
                        'Düzenle',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeM,
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
                            content: DeleteRsvBox(
                                ssn: ssn, notifyParent: notifyParent),
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
                      child: Text(
                        'Sil',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeM,
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
class AddRsvBox extends StatelessWidget {
  final Function() notifyParent;
  const AddRsvBox({Key? key, required this.notifyParent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                child: Text(
                  'Yeni Rezervasyon Bilgileri',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: fontSizeM,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: Container(
                  child: TextFormField(
                    controller: ssnController,
                    keyboardType: TextInputType.number,
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
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Kamp Adı",
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: Container(
                  child: TextFormField(
                    controller: surnameController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Başlangıç Tarihi (Gün.Ay.Yıl)",
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: Container(
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Rezervasyon Gün Sayısı",
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: Container(
                  child: TextFormField(
                    controller: hesCodeController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "HES Kodu",
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(10),
                child: Container(
                  child: TextFormField(
                    controller: tentController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Çadır istiyor musunuz?",
                    ),
                  ),
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    int control = await addNewUser();
                    await clearAllControllers();
                    searchedList = null;
                    notifyParent();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: UserAddedBox(
                            control: control,
                          ),
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
                    child: Text(
                      'Kaydet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSizeM,
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
      ),
    );
  }
}

class EditRsvBox extends StatelessWidget {
  final String ssn;
  final String name;
  final String surname;
  final String phone;
  final String hesCode;
  final Function() notifyParent;
  const EditRsvBox({
    Key? key,
    required this.ssn,
    required this.name,
    required this.surname,
    required this.phone,
    required this.hesCode,
    required this.notifyParent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
                child: Text(
                  'Yeni Rezervasyon Bilgileri',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: fontSizeM,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Şuanki İsim: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      name,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Yeni İsim",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Şuanki Soyisim: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      surname,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: TextFormField(
                  controller: surnameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Yeni Soyisim",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Şuanki Telefon: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      phone,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Yeni Telefon",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Şuanki HES Kodu: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      hesCode,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 0, 5, 20),
                child: TextFormField(
                  controller: hesCodeController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: "Yeni HES Kodu",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  updateUser(ssn);
                  Navigator.pop(context);
                  notifyParent();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: RsvUpdatedBox(),
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
                  child: Text(
                    'Kaydet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSizeM,
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
      ),
    );
  }
}

class DeleteRsvBox extends StatelessWidget {
  final String ssn;
  final Function() notifyParent;
  const DeleteRsvBox({Key? key, required this.ssn, required this.notifyParent})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width * 2 / 3,
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
              child: Text(
                'Bu rezervasyonu silmek istediğinize emin misiniz?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: fontSizeM,
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
                      child: Text(
                        'Hayır',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeM,
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
                    onTap: () async {
                      await deleteUser(ssn);
                      Navigator.pop(context);
                      searchedList = null;
                      notifyParent();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: DeletedRsvBox(),
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
                      child: Text(
                        'Evet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSizeM,
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
  final int control;
  const UserAddedBox({Key? key, required this.control}) : super(key: key);
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
              child: Text(
                (control == 1)
                    ? 'Rezervasyon başarıyla eklendi.'
                    : (control == 0)
                        ? 'Bilgiler boş bırakılamaz.'
                        : 'Bu rezervasyon zaten var.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: fontSizeM,
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
                child: Text(
                  'Tamam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeM,
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

class RsvUpdatedBox extends StatelessWidget {
  const RsvUpdatedBox({Key? key}) : super(key: key);
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
              child: Text(
                'Rezervasyon bilgileri güncellendi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: fontSizeM,
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
                child: Text(
                  'Tamam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeM,
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

class DeletedRsvBox extends StatelessWidget {
  const DeletedRsvBox({Key? key}) : super(key: key);
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
              child: Text(
                'Rezervasyon başarıyla silindi.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: fontSizeM,
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
                child: Text(
                  'Tamam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSizeM,
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
