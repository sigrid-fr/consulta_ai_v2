import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class noApp extends StatelessWidget {

  final DocumentSnapshot document;
  final double opacityValue;
  final String currentImage;
  final Color textColor;
  final String choice;
  noApp({this.document,this.opacityValue,this.currentImage,this.textColor,this.choice});

  @override
  Widget build(BuildContext context) {
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Opacity(
      opacity: opacityValue,
      child: SizedBox(
        width: double.infinity,
        height: 117.0 * textScale,
        child: DecoratedBox(
          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(document["appDate"], textScaleFactor: 1.4, style: TextStyle(fontSize: 20 * textScale,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                      Row(
                        children: [
                          Text(document["appTime"], textScaleFactor: 1.2, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                          SizedBox(width:5.0),
                          Text("|", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          SizedBox(width:5.0),
                          Text(document["appDoctor"], textScaleFactor: 1.2, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                        ],
                      ),
                      SizedBox(height:5),
                      Text(document[choice].toUpperCase(), textScaleFactor: 1.3, style: TextStyle(fontSize: 29, color: textColor,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 10.0, 25.0, 5.0),
                child: CircleAvatar(backgroundImage: AssetImage(currentImage), radius: 35),
              ),
              //FlatButton(minWidth:40.0, height: 50.0, onPressed: (){}, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
            ],
          ),
        ),
      ),
    );
  }
}
