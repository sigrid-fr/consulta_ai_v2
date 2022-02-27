import 'package:consulta_ai/models/doctor.dart';
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

final _formKey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();

class _AppointmentState extends State<Appointment> {

  bool loading = false;
  String currentAddress;
  var currentAppDoctor;
  String currentDocNotes;
  var currentDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  final List<String> timeframe = ['0800 (8:00am)', '1000 (10:00am)', '1200 (12:00pm) ','1400 (2:00pm)', '1600 (4:00pm) ','1800 (6:00pm) '];
  String currentAppTime = '0800 (8:00am)';
  //final List<Doctor> doctors = getDoctorList();


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return loading? Loading(): Scaffold(
      key: _scaffoldKey,
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
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          child: Form(
            key:_formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: Image.asset('asset/appointment.png',height:160.0),),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text("Preencha os dados",
                        style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20.0,),
                  Text('DATA DO ATENDIMENTO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: currentDate,
                    enabled: false,
                    onChanged: (dt) {
                      setState(() => currentDate = dt);
                      print('Selected date: $currentDate');
                    },
                  ),
                  SizedBox(height: 20.0),
                  Text('HORA DO ATENDIMENTO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                    isExpanded: true,
                    value: (currentAppTime == null) ? timeframe[0] : currentAppTime,

                    items: timeframe.map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: (val)=>(val == timeframe[0]) ? 'Selecione um horário diferente!' : null,
                    onChanged: (String newValue){
                      setState(() {
                        currentAppTime = newValue;
                        print(newValue);
                      });
                    },
                  ),
                  SizedBox(height:20.0),
                  Text('PROFISSIONAL SELECIONADO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: currentAppDoctor=widget.doctor.name,
                    enabled: false,
                    //validator: (val)=>(val.isEmpty) ? 'Selecione um profissional' : null,
                    onChanged: (String val){
                      setState(() {
                        currentAppDoctor = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height:20.0),
                  Text('ESPECIALIDADE',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  TextFormField(
                    initialValue: widget.doctor.category == Category.CUIDADOR ? "Cuidador(a)" : widget.doctor.category == Category.PERSONAL ? "Personal" : widget.doctor.category == Category.GERIATRA ? "Geriatra" : "Enfermeiro(a)",
                    enabled: false,
                  ),
                  SizedBox(height: 20.0),
                  Text('ENDEREÇO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Rua general Vargas, 534, Cohafuma'),
                    //decoration: textDecoration.copyWith(hintText: 'Password'),
                    validator: (val)=>(val.isEmpty) ? 'Digite o seu endereço para atendimento' : null,
                    onChanged: (val){
                      setState(() {
                        currentAddress = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Text('ORIENTAÇÃO PARA O PROFISSIONAL',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Orientação para o profissional (Se houver)'),
                    onChanged: (val){
                      setState(() {
                        currentDocNotes = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 0.0,horizontal: 50.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RaisedButton(
                            color: Colors.green[500],
                            onPressed: () async{
                              if(_formKey.currentState.validate() && currentAppTime != '0800 (8:00am)'){
                                _displaySnackBar(context, 'Dados enviados com sucesso!');
                                await DatabaseService(uid: user.uid).updateAppData(
                                    currentDate,currentAppTime,currentAppDoctor, currentAddress, currentDocNotes
                                );
                                Navigator.pop(context);
                              }
                              //
                            },
                            child: Text('Adicionar', style:TextStyle(color: Colors.white),)
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
  }
  _displaySnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(text),
      elevation: 7.0,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

}
