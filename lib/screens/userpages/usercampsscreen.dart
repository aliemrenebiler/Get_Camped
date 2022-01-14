import 'package:flutter/material.dart';
import 'package:get_camped/database/allmethods.dart';
import 'package:get_camped/database/theme.dart';
import '../../database/allclasses.dart';
import '../../database/allvariables.dart';

class UsersCampsScreen extends StatefulWidget {
  const UsersCampsScreen({Key? key}) : super(key: key);

  @override
  State<UsersCampsScreen> createState() => _UsersCampsScreenState();
}

class _UsersCampsScreenState extends State<UsersCampsScreen> {
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
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            SearchCampingBox(notifyParent: refresh),
            // Row(
            //   children: [
            //     // Expanded(
            //     //   child: ListAllButton(notifyParent: refresh),
            //     // ),
            //     Expanded(
            //       child: AddRsvButton(notifyParent: refresh),
            //     )
            //   ],
            // ),
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
class SearchCampingBox extends StatelessWidget {
  final Function() notifyParent;
  SearchCampingBox({Key? key, required this.notifyParent}) : super(key: key);
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
                await getUserRsv(currentCamp.id!);
                await clearAllControllers();
                notifyParent();
              },
              child: Container(
                alignment: Alignment.center,
                width: 70,
                height: 50,
                child: Text(
                  'Kamp Alanlarını Görüntüle',
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
        ],
      ),
      decoration: const BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
