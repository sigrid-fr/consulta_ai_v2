import 'package:flutter/material.dart';
import 'package:consulta_ai/models/doctor.dart';
import 'doctor_widget.dart';

class CategoryList extends StatelessWidget {

  final Category category;

  CategoryList({this.category});

   @override
  Widget build(BuildContext context) {
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          (category == Category.CUIDADOR ? "Cuidadores" : category == Category.PERSONAL ? "Personais" : category == Category.GERIATRA ? "Geriatras" : "Enfermeiros"),
          style: TextStyle(
            color: Colors.white,
         ),
         ),
        elevation: 0,
        //centerTitle: true,
        //title: Text(
        //  (category == Category.CUIDADOR ? "Cuidadores" : category == Category.PERSONAL ? "Personais" : category == Category.GERIATRIA ? "Geriatria" : "Enfermeiros") + " Category",
        //  style: TextStyle(
        //    color: Colors.grey[800],
         // ),
       // ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFilter("Manhã", true),
                buildFilter("FimdeSemana", false),
                buildFilter("Tarde", true),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: 1 / 1.55,
                crossAxisCount: 1,
                crossAxisSpacing: 15,
                children: getDoctorList().where((i) => i.category == category).map((item) {
                  return DoctorWidget(
                    doctor: item,
                    index: 0,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFilter(String name, bool selected){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        boxShadow: [
          BoxShadow(
            color: selected ? Colors.blue[300].withOpacity(0.5) : Colors.white,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
        color: selected ? Colors.blue[300] : Colors.white,
      ),
      child: Row(
        children: [
          Text(
            name,
            textScaleFactor: 1.3,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.grey[800],
            ),
          ),

          selected 
          ? Row(
            children: [

              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.clear,
                color: Colors.white,
                size: 18,
              ),

            ],
          )
          : Container(),
        ],
      ),
    );
  }
}