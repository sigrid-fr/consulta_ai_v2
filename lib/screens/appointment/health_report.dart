import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/screens/appointment/medicine.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';

bool loading = false;
class HealthReport extends StatelessWidget {
  final DocumentSnapshot document;
  HealthReport({this.document});
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
                title: Text("Relatório de Atendimento",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child: Image.asset('asset/doctor1.png',height:200.0, width: 380,),),
                        SizedBox(height: 20.0,),
                        Text("Detalhes do Atendimento",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        Text("Nome: ${userData.name}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Data: ${document["appDate"]}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Hora: ${document["appTime"]}",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Local: ${document["address"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:5.0),
                        Text("Profissional: ${document["appDoctor"]}", style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:20.0),
                        Text("Detalhes da Recomendação",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text('Medicação',style: TextStyle(fontSize: 15.0,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                                  ),
                                  flex: 2,
                                ),
                                SizedBox(width: 170.0,),
                                Flexible(
                                  child: Text('Quantidade',style: TextStyle(fontSize: 15.0,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                                  flex: 1,
                                ),
                              ],
                            )),
                        SizedBox(height:5.0),
                        Medicine(medicine: document["medicine"],quantity: document["quantity"],),
                        Medicine(medicine: document["medicine1"],quantity: document["quantity1"],),
                        Medicine(medicine: document["medicine2"],quantity: document["quantity2"],),
                        Text('Recomendações',style: TextStyle(fontSize: 15.0,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                        SizedBox(height:5.0),
                        Text(document["doc_comment"] ?? "---(No Special Comment)---",style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),
                        SizedBox(height:20.0),
                        Text('Observação',style: TextStyle(fontSize: 15.0,color: Colors.grey[700],fontWeight: FontWeight.bold),),
                        SizedBox(height:5.0),
                        Text(document["shortComment"],style: TextStyle(color: Colors.grey[700], fontSize: 15.0,fontWeight: FontWeight.w300)),

                        SizedBox(height: 20.0,),
                      ]
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
