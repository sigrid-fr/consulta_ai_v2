import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:consulta_ai/screens/appointment/app_details.dart';
import 'package:consulta_ai/screens/appointment/health_report.dart';
import 'package:intl/intl.dart';
import 'app_accepted_request.dart';

class okApp extends StatelessWidget {

  final DocumentSnapshot document;
  final double opacityValue;
  final String currentImage;
  final Color textColor;
  final String choice;

  okApp({this.document,this.opacityValue,this.currentImage,this.textColor,this.choice});

  @override
  Widget build(BuildContext context) {
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Opacity(
      opacity: opacityValue,
      child: SizedBox(
        width: double.infinity,
        height: 150.0 * textScale,
        child: DecoratedBox(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
          child: FlatButton(
            onPressed: (){
              print(document[choice]);
              if(document[choice] == "aceito"){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppAcceptedRequestView(document:document)));
              }
              else if(document[choice] == "visitado"){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppDetails(document:document)));
              }
              else if(document[choice] == "finalizado"){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HealthReport(document:document)));
              }
          },
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Data "+document["appDate"].toString(), textScaleFactor: 1.3, style: TextStyle(fontSize: 18 * textScale,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                        SizedBox(height:5),
                        Row(
                          children: [
                            Text(document["appTime"]+"h", textScaleFactor: 1.3, style: TextStyle(fontSize: 13.5, color: Colors.grey[700])),
                            SizedBox(width:5.0),
                            Text("|", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                            SizedBox(width:5.0),
                            Text(document["appDoctor"], textScaleFactor: 1.3, style: TextStyle(fontSize: 13.5, color: Colors.grey[700])),
                          ],
                        ),
                        SizedBox(height:5),
                        Text("Especialidade: "+document["appCategory"], textScaleFactor: 1.3, style: TextStyle(fontSize: 13.5, color: Colors.grey[700])),
                        SizedBox(height:5),
                        Text(document[choice].toUpperCase(), textScaleFactor: 1.2, style: TextStyle(fontSize: 28, color: textColor,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10.0, 10.0, 5.0),
                  child: CircleAvatar(backgroundImage: AssetImage(currentImage),radius: 35,),
                ),
                //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

