import 'package:flutter/material.dart';
import 'package:consulta_ai/models/doctor.dart';
import 'package:consulta_ai/screens/category/doctor_detail.dart';

class DoctorWidget extends StatelessWidget {

  final Doctor doctor;
  final int index;

  DoctorWidget({this.doctor, this.index});

  @override
  Widget build(BuildContext context) {
    var textScale = MediaQuery.of(context).textScaleFactor;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DoctorDetail(doctor: doctor)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        margin: EdgeInsets.only(right: index != null ? 16 : 0, left: index == 0 ? 16 : 0, bottom: 16),
        width: 225,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Stack(
                children: [

                  Hero(
                    tag: doctor.imageUrl,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(doctor.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    decoration: BoxDecoration(
                      color: doctor.condition == "Manhã" ? Colors.green[100] : doctor.condition == "Tarde" ? Colors.orange[100] : Colors.blue[100],
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      doctor.condition,
                      textScaleFactor: 1.2 * textScale,
                      style: TextStyle(
                        color: doctor.condition == "Manhã" ? Colors.green : doctor.condition == "Tarde" ? Colors.orange : Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  Text(
                    doctor.name,
                    textScaleFactor: 1.25,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  Text(
                    doctor.category ==
                        Category.CUIDADOR ? "Cuidador(a)" :
                        doctor.category == Category.PERSONAL
                        ? "Personal"
                        : doctor.category == Category.GERIATRA
                        ? "Geriatra"
                        : "Enfermeiro(a)",
                    textScaleFactor: 1.25,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13 * textScale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 8,
                  ),

                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[600],
                        size: 18,
                      ),

                      SizedBox(
                        width: 4,
                      ),

                      Text(
                        doctor.district,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11.5 * textScale,
                        ),
                      ),

                      SizedBox(
                        width: 4,
                      ),

                      Text(
                        "(" + doctor.distance + "km)",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11 * textScale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}