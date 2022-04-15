import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();
bool loading = false;

class AppAcceptedRequestView extends StatelessWidget {

  final DocumentSnapshot document;

  AppAcceptedRequestView({this.document});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            return loading? Loading(): Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.teal,
                centerTitle: true,
                title: Text("Detalhes do Atendimento",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Form(
                    key:_formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(child: Image.asset('asset/detalhes.png',height:180.0),),
                          SizedBox(height: 20.0),
                          SizedBox(height: 20.0,),
                          Text("Detalhes do Atendimento",style: TextStyle(color: Colors.grey[700], fontSize: 21.0, fontWeight: FontWeight.bold)),
                          SizedBox(height:30.0),
                          Text("Nome: ${userData.name}",style: TextStyle(color: Colors.grey[700], fontSize: 18.0,fontWeight: FontWeight.w400)),
                          SizedBox(height:5.0),
                          Text("Data: ${document["appDate"]}",style: TextStyle(color: Colors.grey[700], fontSize: 18.0,fontWeight: FontWeight.w400)),
                          SizedBox(height:5.0),
                          Text("Hora: ${document["appTime"]+"h"}",style: TextStyle(color: Colors.grey[700], fontSize: 18.0,fontWeight: FontWeight.w400)),
                          SizedBox(height:5.0),
                          Text("Endereço: ${userData.address}", style: TextStyle(color: Colors.grey[700], fontSize: 18.0,fontWeight: FontWeight.w400)),
                          SizedBox(height:5.0),
                          Text("Profissional: ${document["appDoctor"]}", style: TextStyle(color: Colors.grey[700], fontSize: 18.0,fontWeight: FontWeight.w400)),
                          SizedBox(height:5.0),
                          Text("Especialidade: ${document["appCategory"]}", style: TextStyle(color: Colors.grey[700], fontSize: 18.0,fontWeight: FontWeight.w400)),
                          SizedBox(height:10.0),
                        ]
                    ),
                  ),
                ),
              ),
            );
          }
          else{
            return Loading();
          }
        }
    );
  }
}
