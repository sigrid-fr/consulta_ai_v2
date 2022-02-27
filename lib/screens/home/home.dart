import 'package:consulta_ai/screens/about/aboutList.dart';
import 'package:consulta_ai/screens/category/principal_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/screens/function/Appointment.dart';
import 'package:consulta_ai/screens/home/Emergency.dart';
import 'package:consulta_ai/screens/home/Separator.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    setState(() {
      print("Home Page:");
      print(user.uid);
    });
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          //print("My home page");
          print(snapshot.data);
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /* Text(
                        "Bem vindo(a), ${userData.username}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),*/
                      //SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        height: 160,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage("https://media.istockphoto.com/vectors/electronic-health-record-concept-vector-id1299616187?k=20&m=1299616187&s=612x612&w=0&h=gmUf6TXc8w6NynKB_4p2TzL5PVIztg9UK6TOoY5ckMM="),
                              fit: BoxFit.cover,)
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Itens",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 80.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.redAccent[400],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 5.0, 20.0, 10.0),
                                child: Icon(
                                  Icons.list_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 10.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Solicitações",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height:7.0),
                                      Text("Consulte o status das solicitações",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              FlatButton(
                                  minWidth: 40.0,
                                  height: 50.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => (Homie(index:1))));
                                  },
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 30.0,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        width: double.infinity,
                        height: 80.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.pinkAccent[200],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 5.0, 20.0, 10.0),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 10.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Atendimentos",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height:7.0),
                                      Text("Marque um novo atendimento",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              FlatButton(
                                  minWidth: 40.0,
                                  height: 50.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => (PrincipalHome())));
                                  },
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 30.0,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      SizedBox(
                        width: double.infinity,
                        height: 80.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent[400],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    15, 5.0, 20.0, 10.0),
                                child: Icon(
                                  Icons.search_sharp,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 10.0, 0.0, 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Sobre as Especialidades",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      SizedBox(height:7.0),
                                      Text("Entenda o papel de cada profissional",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FlatButton(
                                  minWidth: 40.0,
                                  height: 50.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => (AboutList())));
                                  },
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 30.0,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 80.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Colors.blueAccent[400],
                              borderRadius: BorderRadius.circular(10.0)),
                          child: FlatButton(
                            onLongPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => (EmergencyCall())));
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      5, 5.0, 20.0, 10.0),
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10.0, 0.0, 10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Contato de Emergência",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(height:10.0),
                                        Text("${userData.etel}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
