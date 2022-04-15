import 'package:brasil_fields/formatter/altura_input_formatter.dart';
import 'package:brasil_fields/formatter/peso_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/medical.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';

class Edit_Medical_Info extends StatefulWidget {

  @override
  _Edit_Medical_InfoState createState() => _Edit_Medical_InfoState();
}

//final _formKey2 = GlobalKey<FormState>();
class _Edit_Medical_InfoState extends State<Edit_Medical_Info> {

  String currentMedicalRecord;
  String currentAllergies;
  String currentMedicine;
  String currentBloodType;
  String currentHeight;
  String currentWeight;
  String currentDisease;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final List<String> bloodType = ['A+', 'AB+', 'O+','B+', 'A-', 'AB-', 'O-','B-'];

    return StreamBuilder<MedicalData>(
        stream: DatabaseService(uid: user.uid).medicalData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            MedicalData medicalData = snapshot.data;

            return Scaffold(
              appBar: AppBar(
                title : Text('Editar Informações Médicas'),
                centerTitle : true,
                backgroundColor: Colors.teal,
                elevation: 0.0,
                automaticallyImplyLeading: true,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  child: Form(
                    //key:_formKey2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(child: Image.asset('asset/medical_card.png',height:160.0),),
                          SizedBox(height: 20.0,),
                          Text('Nº CARTÃO DO SUS',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: medicalData.medical_record ?? null,
                            keyboardType: TextInputType.number,
                            maxLength: 15,
                            decoration: InputDecoration(hintText: 'Nº do Cartão do SUS'),
                            validator: (val)=>(val.isEmpty) ? 'Informe o seu nº do SUS' : null,
                            onChanged: (val){
                              setState(() {
                                currentMedicalRecord = val;
                              });
                              print(val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          Text('ALERGIA(S)',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: medicalData.allergies ?? null,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(hintText: 'Alguma alergia?'),
                            validator: (val)=>(val.isEmpty) ? 'Informe alguma alergia' : null,
                            onChanged: (val){
                              setState(() {
                                currentAllergies = val;
                              });
                              print(val);
                            },
                          ),
                          SizedBox(height: 20.0,),
                          Text('REMÉDIO(S)',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: medicalData.medicine ?? null,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(hintText: 'Tomando algum remédio?'),
                            validator: (val)=>(val.isEmpty) ? 'Informe algum remédio que esteja tomando' : null,
                            onChanged: (val){
                              setState(() {
                                currentMedicine = val;
                              });
                              print(val);
                            },
                          ),
                          SizedBox(height: 20.0,),
                          Text('DOENÇA(S)',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: medicalData.disease ?? null,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(hintText: 'Tem doença(s) crônica(s)?'),
                            validator: (val)=>(val.isEmpty) ? 'Informe se houver doenças crônicas' : null,
                            onChanged: (val){
                              setState(() {
                                currentDisease = val;
                              });
                              print(val);
                            },
                          ),
                          SizedBox(height: 20.0,),
                          Text('MEDIDAS',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          Padding(
                              padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: TextFormField(
                                        initialValue: medicalData.height ?? null,
                                        decoration: const InputDecoration(
                                            hintText: "Altura"),
                                        keyboardType: TextInputType.number,
                                        maxLength: 4,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly,
                                          AlturaInputFormatter(),
                                        ],
                                        validator: (val)=>(val.isEmpty) ? 'Digite a sua altura' : null,
                                        onChanged: (val){
                                          setState(() {
                                            currentHeight = val;
                                          });
                                          print(val);
                                        },
                                      ),
                                    ),
                                    flex: 3,
                                  ),
                                  Flexible(
                                    child: TextFormField(
                                      initialValue: medicalData.weight,
                                      decoration: const InputDecoration(
                                          hintText: "Peso"),
                                      keyboardType: TextInputType.number,
                                      maxLength: 5,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        PesoInputFormatter(),
                                      ],
                                      validator: (val)=>(val.isEmpty) ? 'Digite o seu peso' : null,
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
                          Text('TIPO SANGUÍNEO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                          DropdownButton<String>(
                            value: (currentBloodType == null) ? medicalData.bloodType: currentBloodType,
                            items: bloodType.map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (newValue){
                              setState(() {
                                currentBloodType = newValue;
                                print(currentBloodType);
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RaisedButton(
                                    color: Colors.green[500],
                                    onPressed: () async{
                                      await DatabaseService(uid: user.uid).updateMedicData(
                                          currentMedicalRecord ?? snapshot.data.medical_record,
                                          currentAllergies ?? snapshot.data.allergies,
                                          currentMedicine ?? snapshot.data.medicine,
                                          currentBloodType ?? snapshot.data.bloodType,
                                          currentHeight ?? snapshot.data.height,
                                          currentWeight ?? snapshot.data.weight,
                                          currentDisease ?? snapshot.data.disease
                                      );
                                      await DatabaseService(uid: user.uid).notFirstTime();
                                      Navigator.pop(context);
                                    },
                                    child: Text('Atualizar', style:TextStyle(color: Colors.white),)
                                ),
                                RaisedButton(
                                    color: Colors.deepOrange,
                                    onPressed: () async{
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar', style:TextStyle(color: Colors.white),)
                                ),
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
