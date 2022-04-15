import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyCall extends StatefulWidget {
  @override
  _EmergencyCallState createState() => _EmergencyCallState();
}

class _EmergencyCallState extends State<EmergencyCall> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return SafeArea(
              child: Scaffold(
                backgroundColor:  Color(0xff2e2e2e),
                body: Container(
                  margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 300.0,),
                      Center(child: Text('LIGAÇÃO DE EMERGÊNCIA',style: TextStyle(fontSize: 15.0,color: Colors.grey[500],fontWeight: FontWeight.bold),)),
                      SizedBox(height: 20.0,),
                      Center(
                        child: Text('${userData.etel}',style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 40.0,),
                      SizedBox(
                        width: 420.0,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ButtonTheme(
                                minWidth: 145.0,
                                height: 65.0,
                                child: RaisedButton(
                                    color: Colors.green[500],
                                    onPressed: () async{
                                      launch(('tel://${userData.etel}'));
                                      Navigator.pop(context);
                                    },
                                    child: Text('Ligar', style:TextStyle(color: Colors.white, fontSize: 18),)
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 145.0,
                                height: 65.0,
                                child: RaisedButton(
                                    color: Colors.deepOrange,
                                    onPressed: () async{
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar', style:TextStyle(color: Colors.white, fontSize: 18),)
                                ),
                              ),
                              ],
                            ),
                          ),
                      )
                    ],
                  ),
                ),

              ),
            );
          } else {
            return Loading();
          }
        });
  }
}