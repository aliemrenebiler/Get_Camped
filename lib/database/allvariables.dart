import 'package:flutter/material.dart';
import 'allclasses.dart';

// BURAYA TÜM DEĞİŞKENLERİ YAZABİLİRİZ

var searchedList;

var currentUser = User(
  ssn: '1234567890',
  name: 'Ali Emre',
  surname: 'Nebiler',
  phone: '05123456789',
  hesCode: '1234567890',
);

var ssnController = TextEditingController();
var nameController = TextEditingController();
var surnameController = TextEditingController();
var phoneController = TextEditingController();
var hesCodeController = TextEditingController();
