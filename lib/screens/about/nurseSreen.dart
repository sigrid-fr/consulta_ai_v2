import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'aboutList.dart';

class NurseScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Nunito"
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: SecondPage(),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  var _headingColor = Color(0xFF212121);
  double _headingTop = 100;
  double windowWidth = 0;
  double windowHeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: _headingTop,
                    ),
                    child: Text(
                      "Enfermeiro(a)",
                      style: TextStyle(
                          color: _headingColor,
                          fontSize: 28
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.symmetric(horizontal: 32
                    ),
                    child: Text(
                      "O enfermeiro de idosos mantém o foco no suporte à vida do paciente. Ele é indicado em casos de maior complexidade, tais como: \n"
                          "1. Administração de alimentos via sonda;\n"
                          "2. Controle e higienização de sondas urinárias ou intestinais;\n"
                          "3. Administração de medicamentos injetáveis;\n"
                          "4. Limpeza e cuidados com ferimentos e curativos extensos;\n"
                          "5. Acompanhamento de pós-operatório delicado.\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: _headingColor,
                          fontSize: 17
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 32
              ),
              child: Center(
                child: Image.asset("asset/enfermeiroId.png"),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (AboutList())));
                },
                child: Container(
                  margin: EdgeInsets.all(32),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xFF00796B),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Center(
                    child: Text(
                      "Voltar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}