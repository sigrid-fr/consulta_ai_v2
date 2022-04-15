import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:consulta_ai/models/booking.dart';
import 'package:consulta_ai/models/medical.dart';
import 'package:consulta_ai/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference personal_Info = Firestore.instance.collection('personal_info');

  Future<void> updateUserData(String username,String name, String age, String cpf,String tel, String etel, String address) async {
    return await personal_Info.document(uid).setData({
      'username': username,
      'name': name,
      'age': age,
      'cpf': cpf,
      'tel': tel,
      'etel': etel,
      'address': address,
      'app_date': null,
      'short_comment': null,
      'first': true,
    });
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      username: snapshot.data['username'],
      name: snapshot.data['name'],
      age: snapshot.data['age'],
      cpf: snapshot.data['cpf'],
      tel: snapshot.data['tel'],
      etel: snapshot.data['etel'],
      address: snapshot.data['address'],
      first: snapshot.data["first"],
      appointmentDate: snapshot.data["app_date"] ?? null,
      short_comment: snapshot.data["short_comment"] ?? null,
    );
  }

  Future<void> notFirstTime() async {
    return await personal_Info.document(uid).updateData({
      'first': false,
    });
  }

  // get user doc stream
  Stream<UserData> get userData {
    return personal_Info.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

  //Add Medical Info
  final CollectionReference medical_info = Firestore.instance.collection('medical_info');

  Future<void> updateMedicData(String medical_record,String allergies,String medicine,String bloodType, String height, String weight, String disease) async {
    return await Firestore.instance.collection('medical_info').document(uid).setData({
      'medical_record': medical_record,
      'allergies': allergies,
      'medicine': medicine,
      'blood_type': bloodType,
      'height': height,
      'weight': weight,
      'disease': disease,
    });
  }

  MedicalData _medicalInfoFromSnapshot(DocumentSnapshot snapshot) {
    return MedicalData(
        medical_record: snapshot.data['medical_record'],
        allergies: snapshot.data['allergies'],
        medicine: snapshot.data['medicine'],
        bloodType: snapshot.data['blood_type'],
        height: snapshot.data['height'],
        weight: snapshot.data['weight'],
        disease: snapshot.data['disease']
    );
  }

  Stream<MedicalData> get medicalData {
    return Firestore.instance.collection('medical_info').document(uid).snapshots()
        .map(_medicalInfoFromSnapshot);
  }

  // Appointment collection reference
  // Collection - Atualizar agendamentos
  Future<void> updateAppData(DateTime appDate, String appTime, String appDoctor, String appCategory, String doc_note) async {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatAppDate = formatter.format(appDate);
    await personal_Info.document(uid).updateData({
      'app_date': appDate,
    });
    return await Firestore.instance.collection("appointment_"+uid).document(formatAppDate).setData({
      'appDate': formatAppDate,
      'appTime': appTime,
      'appDoctor': appDoctor,
      'appCategory': appCategory,
      'doc_note': doc_note,
      'month': appDate.month,
      'status': 'pendente',
    });
  }

  // brew list from snapshot
  List<Booking> _bookingFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      print(doc.data);
      return Booking(
        app_date: doc.data['appDate'] ?? DateTime.now(),
        app_time: doc.data['appTime'] ?? "10:03 (10:30)",
        doctor: doc.data['appDoctor'] ?? "Procurando um médico",
        category: doc.data['appCategory'] ?? "Enfermeiro",
        doc_note: doc.data['doc_note'] ?? '',
        month: doc.data['month'],
        status: doc.data['status'],
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Booking>> get booking_info {
    return Firestore.instance.collection("appointment_"+uid).snapshots()
        .map(_bookingFromSnapshot);
  }

  //Health Report
  Future<void> updateHealthReport(String appDate, String medicine,String medicine1,String medicine2,String quantity,String quantity1,String quantity2,String shortComment,String docComment) async {
    //final DateFormat formatter = DateFormat('dd-MM-yyyy');
    //final String formatAppDate = formatter.format(appDate);
    await personal_Info.document(uid).updateData({
      'short_comment': shortComment,
    });
    return await Firestore.instance.collection("appointment_"+uid).document(appDate).updateData({
      'medicine': medicine,
      'medicine1': medicine1,
      'medicine2': medicine2,
      'quantity': quantity,
      'quantity1': quantity1,
      'quantity2': quantity2,
      'status': "finalizado",
      'price': 0.0,
      'price1': 0.0,
      'price2': 0.0,
      'shortComment': shortComment,
      'doc_comment': docComment
    });
  }
}