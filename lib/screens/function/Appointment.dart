import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:consulta_ai/models/doctor.dart';
import 'package:consulta_ai/screens/home/Separator.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';

class Appointment extends StatefulWidget {

  final Doctor doctor;
  Appointment([this.doctor]);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {

  bool loading = false;
  String currentAddress;
  var currentAppDoctor;
  String currentCategory;
  String currentDocNotes;
  DateTime currentDate;
  final List<String> timeframe = [
    '8:00 ',
    '10:00 ',
    '12:00 ',
    '14:00 ',
    '16:00 ',
    '18:00 '
  ];
  String currentAppTime = '8:00 ';
  String currentUsername;
  String currentFullName;
  String currentAge;
  String currentCPF;
  String currentTel;
  String currentETel;
  final firestoreInstance = Firestore.instance;
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return loading ? Loading() : Scaffold(
              //key: _scaffoldKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.teal,
                centerTitle: true,
                title: Text("Adicionar Novo Atendimento",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: Form(
                    //key: _formKey,
                    autovalidate: _validate,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(child: Image.asset(
                              'asset/appointment.png', height: 160.0),),
                          SizedBox(height: 20.0),
                          Center(
                            child: Text("Preencha os dados",
                                style: TextStyle(color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: 20.0,),
                          Text('DATA DO ATENDIMENTO', style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),),
                          DateTimePickerFormField(
                            inputType: InputType.date,
                            format: DateFormat("dd-MM-yyyy"),
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now().subtract(Duration(days: 0)),
                            lastDate: DateTime(2100),
                            //validator: _validarData,
                            editable: false,
                            decoration: InputDecoration(
                              labelText: 'Data',
                            ),
                            onChanged: (dt) {
                              setState(() => currentDate = dt);
                              print('Selecionar dia: $currentDate');
                            },
                          ),
                          SizedBox(height: 20.0),
                          Text('HORA DO ATENDIMENTO', style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey))),
                            isExpanded: true,
                            value: (currentAppTime == null)
                                ? timeframe[0]
                                : currentAppTime,

                            items: timeframe.map<DropdownMenuItem<String>>((
                                String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            //validator: (val)=>(val == timeframe[0]) ? 'Selecione um horário diferente!' : null,
                            onChanged: (String newValue) {
                              setState(() {
                                currentAppTime = newValue;
                                print(newValue);
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          Text('PROFISSIONAL SELECIONADO', style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: currentAppDoctor = widget.doctor.name,
                            enabled: false,
                            onChanged: (String val) {
                              setState(() {
                                currentAppDoctor = val;
                              });
                              print(val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          Text('ESPECIALIDADE', style: TextStyle(fontSize: 12.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: currentCategory = widget.doctor.category ==
                                Category.CUIDADOR ? "Cuidador(a)" : widget
                                .doctor.category == Category.PERSONAL
                                ? "Personal"
                                : widget.doctor.category == Category.GERIATRA
                                ? "Geriatra"
                                : "Enfermeiro(a)",
                            enabled: false,
                            onChanged: (val) {
                              setState(() {
                                currentCategory = val;
                              });
                              print(val);
                            },
                          ),

                          SizedBox(height: 20.0),
                          Text('ENDEREÇO', style: TextStyle(fontSize: 12.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),),
                          TextFormField(
                            initialValue: currentAddress = userData.address,
                            enabled: false,
                            onChanged: (val) {
                              setState(() {
                                currentAddress = val;
                              });
                              print(val);
                            },
                          ),
                          SizedBox(height: 20.0,),
                          Text('ANOTAÇÕES', style: TextStyle(fontSize: 12.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Forma de pagamento? Ponto de referência?'),
                            onChanged: (val) {
                              setState(() {
                                currentDocNotes = val;
                              });
                              print(val);
                            },
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RaisedButton(
                                    color: Colors.green[500],
                                    onPressed: () async {
                                      _validate = true;
                                      if(currentDate != null) {
                                        _displaySnackBar(context,
                                            'Agendamento realizado com sucesso!');
                                        await DatabaseService(uid: user.uid)
                                            .updateAppData(
                                            currentDate, currentAppTime,
                                            currentAppDoctor, currentCategory,
                                            currentDocNotes
                                        );
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => (Homie(index: 1))));
                                      }else {
                                        setState(() {
                                          _displaySnackBar2(context, 'Por favor, selecione uma data!\n');
                                        });
                                      }
                                      //Navigator.pop(context);
                                    },
                                    child: Text('Adicionar',
                                      style: TextStyle(color: Colors.white),)
                                ),
                                RaisedButton(
                                    color: Colors.deepOrange,
                                    onPressed: () async {
                                      _displaySnackBar2(
                                          context, 'Agendamento cancelado!');
                                      Navigator.pop(context);
                                    },
                                    child: Text('Cancelar',
                                      style: TextStyle(color: Colors.white),)
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

  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(text),
      elevation: 7.0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _displaySnackBar2(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.deepOrange,
      content: Text(text),
      elevation: 7.0,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
