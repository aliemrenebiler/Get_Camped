import 'package:postgres/postgres.dart';
import 'allclasses.dart';
import 'allvariables.dart';

// === ADMIN FUNCTIONS ===
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
          VALUES (@ssn,@uname,@lname,@phone,@hesCode,@is_admin);
        ''',
        substitutionValues: {
          'ssn': ssnController.text,
          'uname': nameController.text,
          'lname': surnameController.text,
          'phone': phoneController.text,
          'hesCode': hesCodeController.text,
          'is_admin': 0,
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

Future updateAdminAuth(String ssn) async {
  var newAuthority;
  searchedList = null;
  await getSingleUser(ssn);
  if (searchedList[0][0] == 1) {
    newAuthority = 0;
  } else {
    newAuthority = 1;
  }

  await connection.query(
    '''
        UPDATE users
        SET is_admin = @is_admin
        WHERE ssn = @ssn;
      ''',
    substitutionValues: {
      'ssn': ssn,
      'is_admin': newAuthority,
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

// === USER FUNCTIONS ===
Future getUserRsv(int id) async {
  var count;
  searchedList = null;

  count = await connection.query(
    '''
      SELECT *
      FROM camping
      WHERE cid=@id;
    ''',
    substitutionValues: {
      'id': id,
    },
  );

  if (count[0][0] == 0) {
    searchedList = null;
  } else {
    searchedList = await connection.query(
      '''
      SELECT *
      FROM camping
      WHERE cid=@id;
    ''',
      substitutionValues: {
        'id': id,
      },
    );
  }
}

Future getSingleUserRsv(String ssn) async {
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

// === GENERAL FUNCTIONS ===
Future<int> loginCheck(String ssn) async {
  var count;
  var checkedUser;
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
  if (searchedList != null) {
    checkedUser = searchedList[0];
    currentUser.ssn = ssn;
    currentUser.name = checkedUser[1];
    currentUser.surname = checkedUser[2];
    currentUser.phone = checkedUser[3];
    currentUser.hesCode = checkedUser[4];
    currentUser.isAdmin = checkedUser[5];
    if (currentUser.isAdmin == 1) {
      return 1;
    } else {
      return 0;
    }
  } else {
    return -1;
  }
}

Future clearAllControllers() async {
  ssnController.clear();
  nameController.clear();
  surnameController.clear();
  phoneController.clear();
  hesCodeController.clear();

  idController.clear();
  campNameController.clear();
  cityController.clear();
  capacityController.clear();
  dailyPriceController.clear();
  dateController.clear();
  dayController.clear();
  tentController.clear();
  tentPriceController.clear();

  maxPriceController.clear();
  minPriceController.clear();
}

Future getReservations() async {
  var campNameSearch;
  var cityNameSearch;
  var dateSearch;
  var ssnSearch;

  searchedList = null;

  ssnSearch = await connection.query(
    '''
    SELECT rId,ussn, campingId, startDate,dayAmount,tent,totalCost,pcount
    FROM reservation
    WHERE ussn=@ussn;
    ''',
    substitutionValues: {
      'ussn': ssnController.text,
    },
  );
  campNameSearch = await connection.query(
    '''
    SELECT rId,ussn, campingId, startDate,dayAmount,tent,totalCost,pcount
    FROM reservation,camping
    WHERE cName=@campName AND campingId=cID;
    ''',
    substitutionValues: {
      'campName': campNameController.text,
    },
  );
  cityNameSearch = await connection.query(
    '''
    SELECT rId,ussn, campingId, startDate,dayAmount,tent,totalCost,pcount
    FROM reservation,camping
    WHERE city=@city AND campingId=cId;
    ''',
    substitutionValues: {
      'city': cityController.text,
    },
  );
  dateSearch = await connection.query(
    '''
    SELECT rId,ussn, campingId, startDate,dayAmount,tent,totalCost,pcount
    FROM reservation
    WHERE startDate=@date;
    ''',
    substitutionValues: {
      'date': dateController.text,
    },
  );
  if (dateSearch[0] == '' &&
      cityNameSearch[0] == '' &&
      campNameSearch[0] == '' &&
      ssnSearch[0] == '') {
    searchedList = null;
  }
}

Future getAllReservations() async {
  searchedList = null;
  searchedList = await connection.query('''
    SELECT * FROM reservation
    ''');
}

Future<String> getCamp(int campId) async {
  searchedList = null;
  searchedList = await connection.query(
    '''
    SELECT cName 
    FROM camping
    WHERE campingId=@campId;
    ''',
    substitutionValues: {
      'campId': campId,
    },
  );
  return searchedList[0][0];
}
