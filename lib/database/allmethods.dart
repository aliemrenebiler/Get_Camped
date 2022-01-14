import 'package:postgres/postgres.dart';
import 'allclasses.dart';
import 'allvariables.dart';

// BURAYA TÜM FONKSİYONLARI YAZABİLİRİZ

Future getAllUsers() async {
  int i = 0;
  for (var row in searchedList) {
    userList[i].ssn = row['ssn'];
    userList[i].name = row['uname'];
    userList[i].surname = row['lname'];
    userList[i].phone = row['phone'];
    userList[i].hesCode = row['hesCode'];
    i++;
  }
}
