import 'package:consulta_ai/screens/home/Separator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalScreen extends StatelessWidget {

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
                      "Personal Trainer",
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
                      "O treino personalizado é um conceito que se tem vindo a implantar fortemente nos últimos anos. Com a ajuda de um personal trainer é possível ter um treino à medida, mais motivador e com resultados mais rápidos. Conheça melhor os benefícios do exercício acompanhado.\n"
                          "Quais as vantagens de um treino personalizado?\n"
                          "1. Permite corrigir erros: sob a supervisão do personal trainer, serão corrigidos os erros de execução técnica dos exercícios, privilegiando-se a correção postural de forma a evitar lesões e padrões posturais prejudiciais;\n"
                          "2. É mais seguro: a intensidade e volume do treino são monitorizados com base nos conhecimentos do treinador, tendo em conta a condição física e tipo de objetivos que pretende alcançar;\n"
                          "3. É mais facilmente quantificável: as reavaliações periódicas da composição corporal e capacidades físicas permitem analisar a evolução em todos os parâmetros e reajustar o treino de acordo com os objetivos traçados;\n"
                          "4. É mais ajustável ao tempo disponível: cada treino é agendado de acordo com a sua disponibilidade.",
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
                child: Image.asset("asset/personalTr.png"),
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