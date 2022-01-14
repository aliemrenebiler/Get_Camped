import 'package:postgres/postgres.dart';
import 'allclasses.dart';
import 'allvariables.dart';

// BURAYA TÜM FONKSİYONLARI YAZABİLİRİZ

Future getAllUsers() async {
  searchedList = null;
  searchedList = await connection.query('''
    SELECT * FROM users
    ''');
}

Future getSingleUser() async {
  var count;
  searchedList = null;

  count = await connection.query(
    '''
      SELECT count(*)
      FROM users
      WHERE ssn=@ssn;
    ''',
    substitutionValues: {
      'ssn': ssnController.text,
    },
  );

  if (count[0][0] == 0) {
    searchedList = null;
  } else {
    searchedList = await connection.query(
      '''
      SELECT *
      FROM users
      WHERE ssn=@ssn;
    ''',
      substitutionValues: {
        'ssn': ssnController.text,
      },
    );
  }
}

Future deleteUser(String ssn) async {
  searchedList = null;
  searchedList = await connection.query(
    '''
      DELETE FROM users
      WHERE ssn=@ssn;
    ''',
    substitutionValues: {
      'ssn': ssn,
    },
  );
}

Future<int> addNewUser() async {
  if (ssnController.text.isEmpty ||
      nameController.text.isEmpty ||
      surnameController.text.isEmpty ||
      phoneController.text.isEmpty ||
      hesCodeController.text.isEmpty) {
    return 0;
  } else {
    try {
      await connection.query(
        '''
          INSERT INTO users
          VALUES (@ssn,@uname,@lname,@phone,@hesCode);
        ''',
        substitutionValues: {
          'ssn': ssnController.text,
          'uname': nameController.text,
          'lname': surnameController.text,
          'phone': phoneController.text,
          'hesCode': hesCodeController.text,
        },
      );
      return 1;
    } catch (e) {
      return -1;
    }
  }
}

Future clearAllControllers() async {
  ssnController.clear();
  nameController.clear();
  surnameController.clear();
  phoneController.clear();
  hesCodeController.clear();
}
