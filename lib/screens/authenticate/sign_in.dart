import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:consulta_ai/services/auth.dart';
import 'package:consulta_ai/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String error = '';
  bool loading = false;
  // text field state
  String email = '';
  String password = '';

  //Botão que valida e envia os dados
  Future<void> _submitForm() async {
    final FormState form = _formKey.currentState;
    if (_emailController == null ) {
      showMessage("Por favor, digite seu email!", Colors.orange);
    }
    if (_passwordController == null) {
      showMessage("Por favor, digite sua senha!", Colors.orange);
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
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Login",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Image.asset('asset/sign_in.jpg',height:270.0),
                  SizedBox(height: 5.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (val) => val.isEmpty ? 'Digite o seu email' : null,
                    onChanged: (val){
                      setState(() {
                        email = val;
                      });
                      print(val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Senha"),
                    maxLength: 15,
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    validator: (val)=>val.length < 6 ? 'Digite uma senha com mais de 6 caracteres' : null,
                    obscureText: true,
                    onChanged: (val){
                      setState(() {
                        password = val;
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
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if(result == null){
                            setState(() {
                              error = "Não é possível fazer login!";
                              loading = false;
                            });
                          }
                          else{
                            print("Logado");
                            print(result);
                          }
                        },
                        onLongPress: () async{
                          dynamic result = await _auth.signInAnon();
                          if(result == null){
                            setState(() {
                              error = "Não é possível logar!";
                              loading = false;
                            });
                          }
                          else{
                            print("Logado");
                            print(result);
                          }
                        },
                        child: Text('ENTRAR', style:TextStyle(color: Colors.white, fontSize: 15),)
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  FlatButton(onPressed: () => widget.toggleView(), child: Text("Não tem cadastro? Cadastre-se aqui.",style: TextStyle(color:Colors.teal,fontSize: 15.0, decoration: TextDecoration.underline,)), color: Colors.white,),
                  SizedBox(height: 12.0),
                  Text(error, style: TextStyle(color: Colors.red,fontSize: 14.0)),
                ],
              ),
            )
        ),
      ),
    );
  }
}