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
              padding: EdgeInsets.symmetric(horizontal: 8),
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
                    style: TextStyle(
                      fontSize: 18,
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
              height: 280,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildNewestDoctor(),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "UPAS Perto de Você",
                    style: TextStyle(
                      fontSize: 18,
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
              height: 130,
              margin: EdgeInsets.only(bottom: 16),
              child: PageView(
                physics: BouncingScrollPhysics(),
                children: [
                  buildUpa("asset/upas/upa_vinhais.jpg", "UPA do Vinhais", "(98) 3246-0531"),
                  buildUpa("asset/upas/upa_araçagy.jpg", "UPA do Araçagy", "(98) 3226-9700"),
                  buildUpa("asset/upas/upa_cidadeoperaria.jpg", "UPA da Cidade Operária", " (98) 3247-6429"),
                  buildUpa("asset/upas/upa_vilaluizao.jpg", "Upa Vila Luizão", " (98) 3233-0665"),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildDoctorCategory(Category category, String total, Color color){
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryList(category: category)),
          );
        },
        child: Container(
          height: 120,
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
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
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
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "Total: " + total,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
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
            height: 98,
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
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 12,
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
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
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