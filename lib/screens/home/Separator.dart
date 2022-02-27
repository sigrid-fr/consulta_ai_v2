import 'package:consulta_ai/screens/category/principal.dart';
import 'package:flutter/material.dart';
import 'package:consulta_ai/screens/appointment/app_list.dart';
import 'package:consulta_ai/screens/home/home.dart';
import 'package:consulta_ai/screens/setting/Setting.dart';
import 'package:consulta_ai/services/auth.dart';

class Homie extends StatefulWidget {
  Homie({
    Key key,
    this.index,
  }) : super(key: key);

  int index;
  @override
  _HomieState createState() => _HomieState(currentIndex: this.index);
}

class _HomieState extends State<Homie> {
  int currentIndex;

  _HomieState({this.currentIndex});

  List<Widget> children = [
    Home(),BookingList(),Principal(),Setting()
  ];

  @override
  Widget build(BuildContext context) {

    print(currentIndex);
    final AuthService _auth = AuthService();
    List<Widget> appBar = [
      AppBar(title: Text("Consulta Aí"),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [RaisedButton.icon(onPressed: (){_auth.signOut();},
          icon: Icon(Icons.exit_to_app,color: Colors.white,),
          label: Text("Sair",style: TextStyle(color:Colors.white),),
          color: Colors.teal,)],
      ),
      AppBar(title: Text("Solicitações"),backgroundColor: Colors.teal, centerTitle: true,
        leading: FlatButton(child: Icon(Icons.keyboard_arrow_left,size: 30.0,color: Colors.white,),
          minWidth: 20.0,
          onPressed: (){setState(() {
            currentIndex = 0;
          });},
        ),
      ),
      AppBar(title: Text("Especialidades"),backgroundColor: Colors.teal, centerTitle: true,
        leading: FlatButton(child: Icon(Icons.keyboard_arrow_left,size: 30.0,color: Colors.white,),
          minWidth: 20.0,
          onPressed: (){setState(() {
            currentIndex = 0;
          });},
        ),
      ),
      AppBar(title: Text("Configurações"),backgroundColor: Colors.teal, centerTitle: true,
        leading: FlatButton(child: Icon(Icons.keyboard_arrow_left,size: 30.0,color: Colors.white,),
          minWidth: 20.0,
          onPressed: (){setState(() {
            currentIndex = 0;
          });},
        ),
      ),
    ];
    return Scaffold(
      appBar: appBar[currentIndex],
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.teal,
        backgroundColor: Colors.teal,
        onTap: (int index){setState(() {
          currentIndex = index;
        });},
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home),title:Text("Home") ),
          BottomNavigationBarItem(icon:Icon(Icons.list_rounded),title:Text("Solicitações")),
          BottomNavigationBarItem(icon:Icon(Icons.search_sharp),title:Text("Especialidades")),
          BottomNavigationBarItem(icon:Icon(Icons.settings),title:Text("Configurações")),
        ],
      ),
    );
  }
}
