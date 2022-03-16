import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/screens/wrapper.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';


class AddMedical extends StatefulWidget {
  @override
  _AddMedicalState createState() => _AddMedicalState();
}

class _AddMedicalState extends State<AddMedical> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  bool loading = false;
  String currentMedicalRecord = '';
  String currentAllergies = '';
  String currentMedicine = '';
  String currentHeight = '';
  String currentWeight = '';
  String currentDisease = '';

  final List<String> bloodType = ['A+', 'AB+', 'O+','B+', 'A-', 'AB-', 'O-','B-'];
  String currentBloodType = 'A+';

  //Botão que valida e envia os dados
  Future<void> _submitForm() async {
    final FormState form = _formKey.currentState;

    if (_heightController == null) {
      showMessage("Por favor, digite sua altura!", Colors.orange);
    }
    if (_weightController == null) {
      showMessage("Por favor, digite seu peso!", Colors.orange);
    }else {
      showMessage('Dados salvos com sucesso!', Colors.green);
    }
  }

  //Mostra mensagens em caso de campos inválidos
  void showMessage(String message, [MaterialColor color = Colors.red]) {
    scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Adicionar Informações Médicas",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Form(
            key:_formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Image.asset('asset/medical_card.png',height:160.0),),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text("Adicionar Informações Médicas",
                        style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nº do Cartão do SUS (Se tiver)'),
                    keyboardType: TextInputType.number,
                    maxLength: 15,
                    //validator: (val)=>(val.isEmpty) ? 'Enter your medical record' : null,
                    onChanged: (val){
                      setState(() {
                        currentMedicalRecord = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Alguma alergia?'),
                    keyboardType: TextInputType.text,
                    //validator: (val) => (val.isEmpty) ? 'Campo Obrigatório' : null,
                    onChanged: (val){
                      setState(() {
                        currentAllergies = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Tomando algum remédio?'),
                    keyboardType: TextInputType.text,
                    //decoration: textDecoration.copyWith(hintText: 'Password'),
                    //validator: (val)=>(val.isEmpty) ? 'Enter medicine taking.' : null,
                    onChanged: (val){
                      setState(() {
                        currentMedicine = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Tem doença(s) crônica(s)?'),
                    keyboardType: TextInputType.text,
                    //validator: (val)=>(val.isEmpty) ? 'Enter medicine taking.' : null,
                    onChanged: (val){
                      setState(() {
                        currentDisease = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: "Altura"),
                                keyboardType: TextInputType.number,
                                controller: _heightController,
                                maxLength: 4,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  AlturaInputFormatter(),
                                ],
                                validator: (val) => val.isEmpty ? 'A altura tem que ser > 0' : null,
                                onChanged: (val){
                                  setState(() {
                                    currentHeight = val;
                                  });
                                  print(val);
                                },
                              ),
                            ),
                            flex: 2,
                          ),
                          Flexible(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Peso"),
                              keyboardType: TextInputType.number,
                              controller: _weightController,
                              maxLength: 4,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                PesoInputFormatter(),
                              ],
                              validator: (val) => val.isEmpty ? 'O peso tem que ser > 0' : null,
                              onChanged: (val){
                                setState(() {
                                  currentWeight = val;
                                });
                                print(val);
                              },
                            ),

                            flex: 2,
                          ),
                        ],
                      )),
                  SizedBox(height: 20.0,),
                  Text("Tipo Sanguíneo"),
                  DropdownButton<String>(
                    value: (currentBloodType.isEmpty) ? bloodType[0] : currentBloodType,
                    items: bloodType.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue){
                      setState(() {
                        currentBloodType = newValue;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: RaisedButton(
                        color: Colors.teal,
                        onPressed: () async{
                          _submitForm();
                          await DatabaseService(uid: user.uid).updateMedicData(currentMedicalRecord, currentAllergies, currentMedicine, currentBloodType, currentHeight, currentWeight, currentDisease);
                          await DatabaseService(uid: user.uid).notFirstTime();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Wrapper()),
                          );
                        },
                        child: Text('Adicionar', style:TextStyle(color: Colors.white),)
                    ),
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}