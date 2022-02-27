import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'aboutList.dart';

class GeriatricScreen extends StatelessWidget {
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
                      "Geriatra",
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
                      "O médico geriatra é formado para compreender todas as mudanças físicas e psíquicas decorrentes do processo natural e inevitável do envelhecimento.\n"
                          "Quando procurar um geriatra?\n"
                          "1. Alterações ou perda de memória;\n"
                          "2. Dificuldades de realizar atividades básicas do dia a dia;\n"
                          "3. Mudanças de comportamento;\n"
                          "4. Distúrbios de apetite ou de sono;\n"
                          "5. Quedas e acidentes frequentes.\n",
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
                child: Image.asset("asset/geriatraId.png"),
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