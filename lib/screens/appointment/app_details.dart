import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';

final _formKey = GlobalKey<FormState>();
bool loading = false;
final List<String> doctor_comment = ["Bom!","Mais ou menos!","Ótimo!","Precisa melhorar!"];

class AppDetails extends StatelessWidget {

  final DocumentSnapshot document;
  String currentComment;
  String currentMedicine;
  String currentMedicine1;
  String currentMedicine2;
  String currentQuantity;
  String currentQuantity1;
  String currentQuantity2;
  String currentShortComment = doctor_comment[0];
  AppDetails({this.document});

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
                child: Form(
                  key:_formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(child: Image.asset('asset/doctor4.png',height:160.0),),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text("Para registro do Profissional",
                              style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 20.0,),
                        Text("Detalhes do Atendimento",style: TextStyle(color: Colors.grey[700], fontSize: 21.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        Text("Nome: ${userData.name}",style: TextStyle(color: Colors.grey[700], fontSize: 17.0,fontWeight: FontWeight.w400)),
                        SizedBox(height:5.0),
                        Text("Data: ${document["appDate"]}", style: TextStyle(color: Colors.grey[700], fontSize: 17.0,fontWeight: FontWeight.w400)),
                        SizedBox(height:5.0),
                        Text("Hora: ${document["appTime"]+"h"}",style: TextStyle(color: Colors.grey[700], fontSize: 17.0,fontWeight: FontWeight.w400)),
                        SizedBox(height:5.0),
                        Text("Endereço: ${userData.address}", style: TextStyle(color: Colors.grey[700], fontSize: 17.0,fontWeight: FontWeight.w400)),
                        SizedBox(height:5.0),
                        Text("Profissional: ${document["appDoctor"]}", style: TextStyle(color: Colors.grey[700], fontSize: 17.0,fontWeight: FontWeight.w400)),
                        SizedBox(height:5.0),
                        Text("Especialidade: ${document["appCategory"]}", style: TextStyle(color: Colors.grey[700], fontSize: 17.0,fontWeight: FontWeight.w400)),
                        SizedBox(height:20.0),
                        Text("Detalhes da Recomendação",style: TextStyle(color: Colors.grey[700], fontSize: 21.0, fontWeight: FontWeight.bold)),
                        SizedBox(height:10.0),
                        SizedBox(height:20.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text('Medicação',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                                  ),
                                  flex: 2,
                                ),
                                SizedBox(width: 170.0,),
                                Flexible(
                                  child: Text('Quantidade',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                                  flex: 1,
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: TextFormField(
                                      //initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Nome do Remédio"),
                                      onChanged: (val){
                                        currentMedicine = val;
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Quantidade"),
                                    onChanged: (val){
                                      currentQuantity = val;
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
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
                                    child: TextFormField(
                                      //initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Nome do Remédio"),
                                      onChanged: (val){
                                        currentMedicine1 = val;
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Quantidade"),
                                    onChanged: (val){
                                      currentQuantity1 = val;
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
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
                                    child: TextFormField(
                                      //initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Nome do Remédio"),
                                      //validator: (val)=>(val.isEmpty) ? 'Enter the correct name' : null,
                                      onChanged: (val){
                                        currentMedicine2 = val;
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Quantidade"),
                                    onChanged: (val){
                                      currentQuantity2 = val;
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
                        SizedBox(height:20.0),
                        Text('Recomendações',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Recomendações ao cliente'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          //validator: (val)=>(val.isEmpty) ? 'Enter your advice for the patient' : null,
                          onChanged: (val){
                            currentComment = val;
                            print(val);
                          },
                        ),
                        SizedBox(height:20.0),
                        Text('Observação',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey))),
                          isExpanded: true,
                          value: (currentShortComment == null) ? doctor_comment[0] : currentShortComment,

                          items: doctor_comment.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String newValue){
                            currentShortComment = newValue;
                            print(newValue);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RaisedButton(
                                  color: Colors.green[500],
                                  onPressed: () async{
                                    if(_formKey.currentState.validate()){
                                     await DatabaseService(uid:user.uid).updateHealthReport(document["appDate"], currentMedicine, currentMedicine1,
                                         currentMedicine2, currentQuantity, currentQuantity1, currentQuantity2, currentShortComment, currentComment);
                                      Navigator.pop(context);
                                    }
                                    //
                                  },
                                  child: Text('Adicionar', style:TextStyle(color: Colors.white),)
                              ),
                              RaisedButton(
                                  color: Colors.deepOrange,
                                  onPressed: () async{
                                    //await DatabaseService(uid: user.uid).updateMedicData(currentMedicalRecord, currentAllergies, currentMedicine, currentBloodType);
                                    //await DatabaseService(uid: user.uid).notFirstTime();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar', style:TextStyle(color: Colors.white),)
                              ),
                            ],
                          ),
                        ),
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
