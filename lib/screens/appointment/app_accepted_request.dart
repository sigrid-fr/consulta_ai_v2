import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/cupertino.dart';

class AppAcceptedRequestView extends StatelessWidget {

  final DocumentSnapshot document;
  AppAcceptedRequestView({this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff38757b),
      body: Center(
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: new CircularPercentIndicator(
              radius: 150.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.8,
              center: new Text(
                "80.0%",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white),
              ),
              footer: new Text(
                "\nAtendimento Marcado",
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.white),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Color(0xffF4C724),
            ),
          ),
          Text(
            'Ótimo! Sua solicitação foi aceita pelo profissional.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              width: double.infinity,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Color(0xffF4C724),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${document["appDoctor"]} ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
