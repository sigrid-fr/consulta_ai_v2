import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/screens/home/Separator.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';

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
                      Center(
                        child: Text('${userData.etel}',style: TextStyle(fontSize: 40.0,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                      FadeAnimatedTextKit(
                        duration: Duration(milliseconds: 5000),
                        isRepeatingAnimation: false,
                        onTap: () {
                          print("Tap Event");
                        },
                        text: [
                          "Ligando...",
                          "Conectando!!",
                        ],
                        textStyle: TextStyle(
                            fontSize: 15.0,
                            color: Colors.grey[500]
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30.0,),
                      SizedBox(
                        width: 320.0,
                        child: RawMaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 15.0,horizontal: 5.0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          ),
                          fillColor: Colors.deepOrange[500],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call_end,
                                size: 30.0,
                                color: Colors.grey[200],
                              ),
                              SizedBox(width: 15.0,),
                              Text('Cancelar',style: TextStyle(fontSize: 20.0,color: Colors.grey[200],fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                      ),
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
