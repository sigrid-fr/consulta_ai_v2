import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  
  User({ this.uid });

}

class UserData {

  final String uid;
  final String name;
  final String username;
  final String age;
  final String cpf;
  final String tel;
  final String etel;
  final String address;
  final bool first;
  final Timestamp appointmentDate;
  final String short_comment;

  UserData({ this.uid, this.username,this.name,this.age,this.etel,this.cpf,this.tel,this.address,this.first,this.appointmentDate,this.short_comment});

}