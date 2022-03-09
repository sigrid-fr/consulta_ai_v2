import 'package:consulta_ai/models/doctor.dart';
import 'package:flutter/material.dart';
import 'category_list.dart';
import 'doctor_widget.dart';

class PrincipalHome extends StatefulWidget {
  @override
  _PrincipalHomeState createState() => _PrincipalHomeState();
}

class _PrincipalHomeState extends State<PrincipalHome> {

  List<Doctor> doctors = getDoctorList();

  @override
  Widget build(BuildContext context) {
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Especialidades"),
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6 * textScale),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildDoctorCategory(Category.CUIDADOR, "56", Colors.red),
                      buildDoctorCategory(Category.PERSONAL, "210", Colors.green),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildDoctorCategory(Category.GERIATRA, "90", Colors.blue),
                      buildDoctorCategory(Category.ENFERMEIRO, "340", Colors.orange),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Cadastrados Recentemente",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),

                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            Container(
              height: 280 * textScale,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildNewestDoctor(),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Upas Perto de Você",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),

                  Icon(
                    Icons.more_horiz,
                    color: Colors.grey[800],
                  ),

                ],
              ),
            ),

            Container(
              height: 130 * textScale,
              margin: EdgeInsets.only(bottom: 16),
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: [
                  buildUpa("asset/upas/upa_vinhais.jpg", "Vinhais", "(98) 3246-0531"),
                  buildUpa("asset/upas/upa_araçagy.jpg", "Araçagy", "(98) 3226-9700"),
                  buildUpa("asset/upas/upa_cidadeoperaria.jpg", "Cidade Operária", " (98) 3247-6429"),
                  buildUpa("asset/upas/upa_vilaluizao.jpg", "Vila Luizão", " (98) 3233-0665"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDoctorCategory(Category category, String total, Color color){
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryList(category: category)),
          );
        },
        child: Container(
          height: 120 * textScale,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [

              Container(
                height: 56 * textScale,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30 * textScale,
                    width: 30,
                    child: Image.asset(
                      "asset/categorias/" + (category == Category.CUIDADOR ? "cuidador" : category == Category.PERSONAL ? "personal" : category == Category.GERIATRA ? "geriatria" : "enfermeiro") + ".png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 12,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    category == Category.CUIDADOR ? "Cuidador" : category == Category.PERSONAL ? "Personal" : category == Category.GERIATRA ? "Geriatra" : "Enfermeiro",
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Total: " + total,
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNewestDoctor(){
    List<Widget> list = [];
    for (var i = 0; i < doctors.length; i++) {
      if(doctors[i].newest){
        list.add(
            DoctorWidget(
                doctor: doctors[i],
                index: i
            )
        );
      }
    }
    return list;
  }

  Widget buildUpa(String imageUrl, String name, String phone){
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Row(
        children: [

          Container(
            height: 98 * textScale,
            width: 98,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(
            width: 16,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                name,
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 14 * textScale,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 8,
              ),

              Row(
                children: [

                  Icon(
                    Icons.phone,
                    color: Colors.grey[800],
                    size: 18,
                  ),

                  SizedBox(
                    width: 8,
                  ),

                  Text(
                    phone,
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 13 * textScale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: 8,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  "ABERTO - 24hrs",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}