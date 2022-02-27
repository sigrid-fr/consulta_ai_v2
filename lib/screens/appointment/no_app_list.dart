import 'package:consulta_ai/screens/category/principal_home.dart';
import 'package:flutter/material.dart';

class NoDataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 80.0),
        child: Column(
          children: [
            Image.asset('asset/nodata.png',height:190.0),
            SizedBox(height:20.0),
            Text("Registro(s) não encontrados",style: TextStyle(color: Colors.grey[700], fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height:20.0),
            RaisedButton(
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (PrincipalHome())));
                },
                child: Text('Adicionar Nova Consulta', style:TextStyle(color: Colors.white,fontSize: 15.0),)
            ),
          ],
        ),
      ),
    );
  }
}
