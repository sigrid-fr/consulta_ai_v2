import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:consulta_ai/services/auth.dart';
import 'package:consulta_ai/shared/loading.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  //final _formKey = GlobalKey<FormState>();
  //final scaffoldKey = new GlobalKey<ScaffoldState>();

  //text field state
  String error = '';
  String email = '';
  String password = '';
  String currentUsername = '';
  String currentFullName = '';
  String currentAge;
  String currentCPF = '';
  String currentTel = '';
  String currentETel = '';
  String currentAddress = '';
  bool loading = false;
  bool _validate = false;

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe seu nome e sobrenome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Digite o seu Email";
    } else if(!regExp.hasMatch(value)){
      return "Email inválido!";
    }else {
      return null;
    }
  }

  String _validarSenha(String value) {
    if (value.length == 0) {
      return "Digite sua Senha";
    } else if(value.length < 6){
      return "A senha deve ter ao menos 6 caracteres";
    }else {
      return null;
    }
  }

  String _validarApelido(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome de usuário";
    } else if (!regExp.hasMatch(value)) {
      return "O nome de usuário deve conter caracteres de a-z ou A-Z";
    } else if (value.length < 3) {
      return "O nome de usuário deve conter ao menos 3 caracteres";
    }
    return null;
  }

  String _validarEndereco(String value) {
    if (value.length == 0) {
      return "Informe o seu endereço completo";
    } else if (value.length < 5) {
      return "O endereço deve conter ao menos 5 caracteres";
    }
    return null;
  }

  String _validarIdade(String value) {
    if (value.length == 0) {
      return "Sua Idade";
    } else if(value.length < 2){
      return "2 dígitos";
    }else {
      return null;
    }
  }

  String _validarCpf(String value) {
    if (value.length == 0) {
      return "Digite seu CPF";
    }else if(value.length < 14){
      return "O CPF deve ter ao menos 11 dígitos";
    }else {
      return null;
    }
  }

  String _validarCelular(String value) {
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length < 15){
      return "O celular deve ter ao menos 11 dígitos";
    }else {
      return null;
    }
  }

  String _validarCelularEmerg(String value) {
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length < 15){
      return "O celular deve ter ao menos 11 dígitos";
    }else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar:  AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => widget.toggleView(),),
        title: Text("Cadastro",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
          child: Form(
            //key:_formKey,
            autovalidate: _validate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Image.asset('asset/register.png',height:299.0)),
                SizedBox(height: 20.0),
                Center(
                  child: Text("Campos Obrigatórios",
                      style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                //SizedBox(height: 5.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  //controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validarEmail,
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Senha'),
                  maxLength: 12,
                  validator: _validarSenha,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  //controller: _passwordController,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                    print(val);
                  },
                ),

                SizedBox(height: 40.0),
                Text("Informações Pessoais",
                    style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Apelido/Nome (De 3-12 caracteres)'),
                  //controller: _usernameController,
                  validator: _validarApelido,
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
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Nome Completo',
                              ),
                              //controller: _fullNameController,
                              maxLength: 35,
                              validator: _validarNome,
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
                            decoration: const InputDecoration(labelText: 'Idade'),
                            //controller: _ageController,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: _validarIdade,
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'CPF'),
                  //controller: _cpfController,
                  keyboardType: TextInputType.number,
                  maxLength: 14,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  validator: _validarCpf,
                  onChanged: (val){
                    setState(() {
                      currentCPF = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Endereço (Rua, Número, Bairro, Referência)'),
                  validator: _validarEndereco,
                  onChanged: (val){
                    setState(() {
                      currentAddress = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Celular'),
                  //controller: _telephoneController,
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  validator: _validarCelular,
                  onChanged: (val){
                    setState(() {
                      currentTel = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Celular de Emergência (Familiar/Responsável)'),
                  //controller: _eTelController,
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  validator: _validarCelularEmerg,
                  onChanged: (val){
                    setState(() {
                      currentETel = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 30.0),
                ButtonTheme(
                  minWidth: 350.0,
                  height: 55.0,
                  child: RaisedButton(
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () async{
                        _validate = true;
                        print(email);
                        print(password);
                        print(currentUsername);
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(email,password,currentUsername,currentFullName,currentAge,currentCPF,currentTel,currentETel, currentAddress);
                        if(result == null){
                          setState(() {
                            error = "\n\t\t\tNão foi possível cadastrar! Verifique os dados!\n";
                            loading = false;
                          });
                        }
                      },
                      child: Text('CADASTRAR', style:TextStyle(color: Colors.white, fontSize: 15),)
                  ),
                ),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}