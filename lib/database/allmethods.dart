import 'package:postgres/postgres.dart';
import 'allclasses.dart';
import 'allvariables.dart';

// ADMIN FUNCTIONS
Future getAllUsers() async {
  searchedList = null;
  searchedList = await connection.query('''
    SELECT * FROM users
    ''');
}

Future getSingleUser(String ssn) async {
  var count;
  searchedList = null;

  count = await connection.query(
    '''
      SELECT count(*)
      FROM users
      WHERE ssn=@ssn;
    ''',
    substitutionValues: {
      'ssn': ssn,
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
        'ssn': ssn,
      },
    );
  }
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

Future updateUser(String ssn) async {
  searchedList = null;
  await getSingleUser(ssn);
  var oldUser = searchedList[0];
  await connection.query(
    '''
        UPDATE users
        SET uname = @uname, lname = @lname,
        phone = @phone, hesCode = @hesCode 
        WHERE ssn = @ssn;
      ''',
    substitutionValues: {
      'ssn': ssn,
      'uname':
          (nameController.text.isNotEmpty) ? nameController.text : oldUser[1],
      'lname': (surnameController.text.isNotEmpty)
          ? surnameController.text
          : oldUser[2],
      'phone':
          (phoneController.text.isNotEmpty) ? phoneController.text : oldUser[3],
      'hesCode': (hesCodeController.text.isNotEmpty)
          ? hesCodeController.text
          : oldUser[4],
    },
  );
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

// GENERAL FUNCTIONS
Future clearAllControllers() async {
  ssnController.clear();
  nameController.clear();
  surnameController.clear();
  phoneController.clear();
  hesCodeController.clear();

  campIdController.clear();
  cityController.clear();
  capacityController.clear();
  dailyPriceController.clear();
  tentController.clear();
  tentPriceController.clear();
}
