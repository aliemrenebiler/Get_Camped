import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'allclasses.dart';

// BURAYA TÜM DEĞİŞKENLERİ YAZABİLİRİZ

var searchedList;
var row;

List<User> userList = [];

var connection = PostgreSQLConnection(
  '10.0.2.2',
  5432,
  'getCamped_db',
  username: 'postgres',
  password: '7756',
);

var currentUser = User(
  ssn: '1234567890',
  name: 'Ali Emre',
  surname: 'Nebiler',
  phone: '05123456789',
  hesCode: '1234567890',
);

var currentCamp = Camp(
  id: '0987654321',
  name: 'MyCamp.com',
  city: 'İstanbul',
  capacity: 100,
  dailyPrice: 20,
  tent: true,
  tentPrice: 10,
);

var ssnController = TextEditingController();
var nameController = TextEditingController();
var surnameController = TextEditingController();
var phoneController = TextEditingController();
var hesCodeController = TextEditingController();

var campIdController = TextEditingController();
var cityController = TextEditingController();
var capacityController = TextEditingController();
var dailyPriceController = TextEditingController();
var tentController = TextEditingController();
var tentPriceController = TextEditingController();
