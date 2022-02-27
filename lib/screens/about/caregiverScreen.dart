import 'package:consulta_ai/screens/home/Separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaregiverScreen extends StatelessWidget {
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
                          "Cuidador(a)",
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
                          "A função do cuidador é fazer pela pessoa assistida tudo o que ela própria faria por si, não fossem suas incapacidades, dentro dos limites legais e da razoabilidade que uma relação de confiança exige, como: \n"
                              "1. Auxílio na higiene do paciente;\n"
                              "2. Lavagem das roupas de cama da pessoa assistida, se necessário;\n"
                              "3. Auxílio na oferta da alimentação;\n"
                              "4. Controle e oferta da medicação oral;\n"
                              "5. Higienização do ambiente onde o idoso fica (incluíndo o banheiro);\n"
                              "6. Acionar os familiares ou o SAMU em situações de emergência.\n",
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
                    child: Image.asset("asset/cuidadorId.png"),
                  ),
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (Homie(index:0))));
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