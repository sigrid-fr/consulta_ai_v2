import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consulta_ai/models/doctor.dart';
import 'package:consulta_ai/screens/function/Appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/screens/appointment/approve_app.dart';
import 'package:consulta_ai/screens/appointment/no_app_list.dart';
import 'package:consulta_ai/screens/appointment/others_app.dart';


class BookingList extends StatefulWidget {

  final Appointment doctor;
  BookingList([this.doctor]);

  @override
  _BookingListState createState() => _BookingListState();
}

double opacityValue = 0.0;
bool visitado = true;
final List<String> doc_pic = ['asset/doctor.jpg','asset/doctor1.jpg','asset/doctor2.jpg','asset/doctor3.jpg'];
//final List<String> listOfDoc= ['Kaue Ribeiro Carvalho', 'Eduarda Cunha Almeida', 'Mariana Pereira Ribeiro','Fabio Cunha Barbosa'];
//final List<Doctor> doctors = getDoctorList();
String currentImage;
Color textColor;
String currentAppDoctor;

class _BookingListState extends State<BookingList> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder(
      stream: Firestore.instance.collection('appointment_'+user.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasData && snapshot.data.documents.length >0){
          //print(snapshot.data.documents.length == 0);
          //print('Selected date: $currentAppDoctor');
          return SafeArea(
            child: ListView(
              children: snapshot.data.documents.map((document) {
                for(int k = 0; k < 4; k++){
                  if(document["appDoctor"][k] != null){
                    currentImage = doc_pic[k];
                  }
                }
                if(document["status"] == 'cancelado'){
                  textColor = Colors.deepOrange[500];
                  opacityValue = 0.4;
                  visitado = false;
                }
                else if(document["status"] == 'pendente'){
                  textColor = Colors.amber;
                  opacityValue = 1.0;
                  visitado = false;
                }
                else if(document["status"] == 'finalizado'){
                  textColor = Colors.blueAccent;
                  opacityValue = 1.0;
                  visitado = true;
                }
                else{
                  textColor = Colors.green;
                  opacityValue = 1.0;
                  visitado = true;
                }
                return (visitado == true)?okApp(document: document,opacityValue: opacityValue,currentImage: currentImage,textColor: textColor,choice: "status",):noApp(document: document,opacityValue: opacityValue,currentImage: currentImage,textColor: textColor,choice: "status");
              }).toList(),
            ),
          );
        }
        else{
          return NoDataApp();
        }
      }
    );
  }
}
