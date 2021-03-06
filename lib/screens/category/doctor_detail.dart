import 'dart:ui';
import 'package:consulta_ai/screens/function/Appointment.dart';
import 'package:flutter/material.dart';
import 'package:consulta_ai/models/doctor.dart';
import 'package:flutter/painting.dart';
import '../../models/doctor.dart';

class DoctorDetail extends StatelessWidget {

  final Doctor doctor;
  DoctorDetail({this.doctor});

  @override
  Widget build(BuildContext context) {
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
            color: Colors.black87
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(doctor.imageUrl, height: 220, width: 150),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 222,
                    height: 220 * textScale,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          doctor.name,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          (doctor.category == Category.ENFERMEIRO ? "Enfermeiro" : doctor.category == Category.CUIDADOR ? "Cuidador" : doctor.category == Category.GERIATRA ? "Geriatra" : "Personal"),
                          style: TextStyle(fontSize: 19, color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          doctor.register,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: <Widget>[
                            IconTile(
                              backColor: Color(0xffFFECDD),
                              imgAssetPath: "asset/details/email.png",
                            ),
                            IconTile(
                              backColor: Color(0xffFEF2F0),
                              imgAssetPath: "asset/details/call.png",
                            ),
                            // IconTile(
                            //   backColor: Color(0xffEBECEF),
                            //   imgAssetPath: "asset/details/video_call.png",
                            // ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "Sobre",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                doctor.name+" ?? " + (doctor.category == Category.ENFERMEIRO ? "Enfermeiro" : doctor.category == Category.CUIDADOR ? "Cuidador" : doctor.category == Category.GERIATRA ? "Geriatra" : "Personal")+
                " em S??o Lu??s e tem vasta experi??ncia na ??rea, tendo trabalhado em v??rios lugares. Recebeu seu diploma da UFMA e est?? na pr??tica h?? mais de 20 anos.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset("asset/details/mappin.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Endere??o",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    doctor.city+",\t" + doctor.district+"\n" + "Rua Portugal, N??400",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("asset/details/clock.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Hor??rio",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    "Segunda - Sexta\n"
                                    "Manh??: 8-12h\n"
                                    "Tarde: 15-17h",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "asset/details/map.png",
                    width: 180,
                  )
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "Valor da Consulta",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "R\$ 180.0",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "Formas de Pagamento Aceita",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Cart??o de Cr??dito, D??bito, Pix e Dinheiro.",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 26,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => (Appointment(doctor))));
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
                              "Agendar",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}