import 'package:consulta_ai/screens/about/personalScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'caregiverScreen.dart';
import 'geriatricScreen.dart';
import 'nurseSreen.dart';

class AboutList extends StatefulWidget {

  @override
  _AboutListState createState() => _AboutListState();
}

class _AboutListState extends State<AboutList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text("Sobre as Especialidades",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.healing),
              title: Text('Cuidador'),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (CaregiverScreen())));
              },
            ),
            ListTile(
              leading: Icon(Icons.run_circle_outlined),
              title: Text('Personal Trainer'),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (PersonalScreen())));
              },
            ),
            ListTile(
              leading: Icon(Icons.health_and_safety),
              title: Text('Enfermeiro'),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (NurseScreen())));
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services_outlined),
              title: Text('Geriatra'),
              trailing: Wrap(
                spacing: 12, // space between two icons
                children: <Widget>[
                  Icon(Icons.chevron_right),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (GeriatricScreen())));
              },
            ),
          ],
        ),
    );
  }
}