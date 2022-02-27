import 'package:consulta_ai/screens/category/principal.dart';
import 'package:consulta_ai/screens/category/principal_home.dart';
import 'package:flutter/material.dart';
import 'package:consulta_ai/screens/function/Appointment.dart';
import 'package:consulta_ai/screens/home/Emergency.dart';
import 'package:consulta_ai/screens/home/Separator.dart';
import 'package:consulta_ai/screens/setting/Edit_Profile.dart';
import 'package:consulta_ai/screens/setting/Edit_medical_info.dart';
import 'package:consulta_ai/services/auth.dart';

final AuthService _auth = AuthService();

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: 70.0,
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
            child: FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                    child: Icon(Icons.people_alt_outlined,color: Colors.grey[700],size: 30.0,),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Editar Perfil",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                          Text("Nome, CPF, Email, Telefone", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfile()),
                    );
                  }, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 70.0,
          child: DecoratedBox(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
            child: FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edit_Medical_Info()),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                    child: Icon(Icons.credit_card_rounded,color: Colors.grey[700],size: 30.0,),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Informações Médicas",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                          Text("Tipo sanguíneo, Doenças", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Edit_Medical_Info()),
                    );
                  }, child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                ],
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 1.0,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (PrincipalHome())));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.calendar_today_outlined,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Adicionar Atendimento",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            Text("Marque o seu atendimento", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (PrincipalHome())));
                    },
                        child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 1.0,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (Homie(index:1))));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.list_rounded,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Solicitações",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            Text("Verifique suas solicitações", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (Homie(index:1))));
                    },
                        child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 1.0,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (Homie(index:2))));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.search_sharp,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Especialidades",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            Text("Faça a sua busca", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (Homie(index:2))));
                    },
                        child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 1.0,
          child: SizedBox(
            width: double.infinity,
            height: 70.0,
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black45))),
              child: FlatButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (EmergencyCall())));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10.0, 20.0, 5.0),
                      child: Icon(Icons.call,color: Colors.grey[700],size: 30.0,),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding:  const EdgeInsets.fromLTRB(0, 15.0, 0.0, 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contato de Emergência",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),),
                            Text("Ligue para alguém importante", style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(minWidth:40.0, height: 50.0, onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => (EmergencyCall())));
                    },
                        child: Icon(Icons.chevron_right,size: 35.0,color: Colors.grey[700],)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
