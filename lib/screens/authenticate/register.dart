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
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _telephoneController = TextEditingController();
  TextEditingController _eTelController = TextEditingController();

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
  bool loading = false;

  //Botão que valida e envia os dados
  Future<void> _submitForm() async {
    final FormState form = _formKey.currentState;

    if (_emailController == null) {
      showMessage("Por favor, digite seu email", Colors.orange);
    }
    if (_passwordController == null) {
      showMessage("Por favor, digite sua senha", Colors.orange);
    }
    if (_usernameController == null) {
      showMessage("Por favor, digite seu usuário", Colors.orange);
    }
    if (_fullNameController == null) {
      showMessage("Por favor, digite seu nome completo", Colors.orange);
    }
    if (_ageController == null) {
      showMessage("Por favor, digite sua idade", Colors.orange);
    }
    if (_cpfController == null) {
      showMessage("Por favor, digite o seu CPF", Colors.orange);
    }
    if (_telephoneController == null) {
      showMessage("Por favor, digite o seu celular", Colors.orange);
    }
    if (_eTelController == null) {
      showMessage("Por favor, digite um celular de emergência", Colors.orange);
    }
    if (!form.validate()) {
      showMessage ('Por favor, verifique os campos e tente novamente.', Colors.orange);
    } else {
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
            key:_formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: Image.asset('asset/register.png',height:299.0)),
                /*SizedBox(height: 20.0),
                Center(
                  child: Text("Introduce yourself.",
                      style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),*/
                //SizedBox(height: 5.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => val.isEmpty ? 'O email é obrigatório' : null,
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
                  maxLength: 15,
                  validator: (val)=> val.length < 6 ? 'Digite uma senha com mais de 6 caracteres' : null,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: _passwordController,
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
                  decoration: InputDecoration(labelText: 'Apelido (De 3-12 caracteres)'),
                  controller: _usernameController,
                  validator: (val) => val.isEmpty ? 'O nome de usuário é obrigatório' : null,
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
                              controller: _fullNameController,
                              maxLength: 35,
                              validator: (val) => val.isEmpty ? 'Digite o seu nome e sobrenome' : null,
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
                            decoration: const InputDecoration(labelText: "Idade"),
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            validator: (val)=>(val.isEmpty) ? 'Digite sua idade' : null,
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
                  controller: _cpfController,
                  keyboardType: TextInputType.number,
                  maxLength: 14,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                  validator: (val) => val.isEmpty ? 'Informe um CPF' : null,
                  onChanged: (val){
                    setState(() {
                      currentCPF = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Telefone'),
                  controller: _telephoneController,
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  validator: (val) => val.isEmpty ? 'Informe um nº de celular' : null,
                  onChanged: (val){
                    setState(() {
                      currentTel = val;
                    });
                    print(val);
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Telefone de Emergência'),
                  controller: _eTelController,
                  keyboardType: TextInputType.number,
                  maxLength: 15,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                  validator: (val) => val.isEmpty ? 'Informe um nº de celular de emergência' : null,
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
                        _submitForm();
                        print(email);
                        print(password);
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(email,password,currentUsername,currentFullName,currentAge,currentCPF,currentTel,currentETel);
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