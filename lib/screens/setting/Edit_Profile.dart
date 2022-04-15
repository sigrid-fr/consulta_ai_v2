import 'package:brasil_fields/formatter/cpf_input_formatter.dart';
import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:consulta_ai/models/user.dart';
import 'package:consulta_ai/services/database.dart';
import 'package:consulta_ai/shared/loading.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}
//final _formKey3 = GlobalKey<FormState>();

class _EditProfileState extends State<EditProfile> {

//final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  String error = '';
  String currentUsername;
  String currentFullName;
  String currentAge;
  String currentCPF;
  String currentTel;
  String currentETel;
  String currentAddress;
  bool loading = false;

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return  Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title : Text('Editar Perfil'),
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
                  padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                  child: Form(
                    //key:_formKey3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: NetworkImage("https://cdn.iconscout.com/icon/free/png-256/avatar-1047-840229.png"),
                            ),
                          ),

                        ),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text("Informações Pessoais",
                            style: TextStyle(color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold),),
                        ),
                        SizedBox(height: 20.0,),
                        Text('APELIDO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          initialValue: userData.username,
                          decoration: InputDecoration(hintText: 'Apelido (De 3-12 caracteres)'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          validator: (val)=>(val.length<3 && val.length >13) ? 'Digite um apelido (De 3-12 caracteres)' : null,
                          onChanged: (val){
                            setState(() {
                              currentUsername = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: Text('NOME COMPLETO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                                  ),
                                  flex: 3,
                                ),
                                SizedBox(width: 160.0,),
                                Flexible(
                                  child: Text('IDADE',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                                  flex: 1,
                                ),
                              ],
                            )),
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
                                      initialValue: userData.name,
                                      decoration: const InputDecoration(
                                          hintText: "Nome Completo"),
                                      maxLength: 35,
                                      validator: (val)=>(val.isEmpty) ? 'Digite o seu nome e sobrenome' : null,
                                      onChanged: (val){
                                        setState(() {
                                          currentFullName = val;
                                        });
                                        print(val);
                                      },
                                    ),
                                  ),
                                  flex: 3,
                                ),
                                Flexible(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        hintText: "Idade"),
                                    initialValue: userData.age,
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    validator: (val)=>(val.isEmpty) ? 'Digite a sua idade' : null,
                                    onChanged: (val){
                                      setState(() {
                                        currentAge = val;
                                      });
                                      print(val);
                                    },
                                  ),

                                  flex: 1,
                                ),
                              ],
                            )),
                        SizedBox(height: 20.0,),
                        Text("CPF ",style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'CPF'),
                          keyboardType: TextInputType.number,
                          maxLength: 14,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfInputFormatter(),
                          ],
                          initialValue: userData.cpf,
                          validator: (val)=>(val.isEmpty) ? 'Digite um cpf válido' : null,
                          onChanged: (val){
                            setState(() {
                              currentCPF = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text('ENDEREÇO',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          initialValue: userData.address,
                          decoration: InputDecoration(hintText: 'Rua, número, bairro, referência'),
                          //decoration: textDecoration.copyWith(hintText: 'Password'),
                          validator: (val)=>(val.length<3 && val.length >13) ? 'Digite o seu endereço' : null,
                          onChanged: (val){
                            setState(() {
                              currentAddress = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text('CELULAR',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          initialValue: userData.tel,
                          decoration: InputDecoration(hintText: 'Nº de Celular'),
                          keyboardType: TextInputType.number,
                          maxLength: 15,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          validator: (val)=>(val.isEmpty) ? 'Digite o seu nº de celular.' : null,
                          onChanged: (val){
                            setState(() {
                              currentTel = val;
                            });
                            print(val);
                          },
                        ),
                        SizedBox(height: 20.0,),
                        Text('CELULAR DE EMERGÊNCIA',style: TextStyle(fontSize: 12.0,color: Colors.grey[500],fontWeight: FontWeight.bold),),
                        TextFormField(
                          initialValue: userData.etel,
                          decoration: InputDecoration(hintText: 'Celular de Emergência'),
                          keyboardType: TextInputType.number,
                          maxLength: 15,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          validator: (val)=>(val.isEmpty) ? 'Digite um nº de emergência' : null,
                          onChanged: (val){
                            setState(() {
                              currentETel = val;
                            });
                            print(val);
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
                                    print(currentUsername);
                                    print(currentFullName);
                                    await DatabaseService(uid: user.uid).updateUserData(
                                      currentUsername ?? snapshot.data.username,
                                      currentFullName ?? snapshot.data.name,
                                      currentAge ?? snapshot.data.age,
                                      currentCPF ?? snapshot.data.cpf,
                                      currentTel ?? snapshot.data.tel,
                                      currentETel ?? snapshot.data.etel,
                                      currentAddress ?? snapshot.data.address,
                                    );
                                    await DatabaseService(uid: user.uid).notFirstTime();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Atualizar', style:TextStyle(color: Colors.white),)
                              ),
                              RaisedButton(
                                  color: Colors.deepOrange,
                                  onPressed: () async{
                                    //await DatabaseService(uid: user.uid).updateUserData(currentUsername,currentFullName,currentTel,currentETel);
                                    //await DatabaseService(uid: user.uid).notFirstTime();
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar', style:TextStyle(color: Colors.white),)
                              ),
                            ],
                          ),
                        ),
                        Text(error, style: TextStyle(color: Colors.red,fontSize: 15.0)),
                      ],
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
