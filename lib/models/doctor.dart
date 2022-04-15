enum Category { ENFERMEIRO, GERIATRA, PERSONAL, CUIDADOR }
enum Condition { Manha, Tarde, FimdeSemana}

class Doctor {

  String name;
  String city;
  String distance;
  String district;
  String condition;
  String register;
  Category category;
  String imageUrl;
  bool newest;

  Doctor(this.name, this.city, this.district,this.distance, this.register, this.condition, this.category, this.imageUrl, this.newest);

}

List<Doctor> getDoctorList(){
  return <Doctor>[
    Doctor("Antonio Silva Almeida", "Sao Luis", "Turu", "2.5", "CREF: 000080-G/MA", "Manhã", Category.PERSONAL, "asset/personal/personal1.jpg", true),
    Doctor("Kaue Ribeiro Carvalho", "Sao Luis", "Centro", "1.2", "CREF: 000010-G/MA", "Manhã", Category.PERSONAL, "asset/personal/personal2.jpg", false),
    Doctor("Thiago Oliveira Fernandes", "Sao Luis", "Anil", "1.2", "CREF: 000020-G/MA", "Manhã", Category.PERSONAL, "asset/personal/personal3.jpg", false),
    Doctor("Kauan Gomes Alves", "Sao Luis", "Anil", "1.2", "CREF: 000030-G/MA", "Manhã", Category.PERSONAL, "asset/personal/personal4.jpg", true),
    Doctor("Arthur Sousa Dias", "Sao Luis", "Angelim", "1.2", "CREF: 000040-G/MA", "Manhã", Category.PERSONAL, "asset/personal/personal5.jpg", true),
    Doctor("Lucas Santos Rodrigues", "Sao Luis", "Angelim", "1.9", "CREF: 000050-G/MA", "Manhã", Category.PERSONAL, "asset/personal/personal6.jpg", false),
    Doctor("Livia Ribeiro Barbosa", "Sao Luis", "Cohab", "2.5", "CREF: 000060-G/MA", "Tarde", Category.PERSONAL, "asset/personal/personal7.jpg", true),
    Doctor("Marisa Almeida Costa", "Sao Luis", "Anil", "1.2", "CREF: 000070-G/MA", "Manhã", Category.PERSONAL, "asset/personal/personal8.jpg", false),
    Doctor("Lavinia Alves Goncalves", "Sao Luis", "Centro", "1.2", "CREF: 000090-G/MA", "Tarde", Category.PERSONAL, "asset/personal/personal9.jpg", false),

    Doctor("Eduarda Cunha Almeida", "Sao Luis", "Anil", "2.5", "CBO: 5162-10/MA", "Tarde", Category.CUIDADOR, "asset/cuidador/cuidador1.jpg", true),
    Doctor("Larissa Cavalcanti Almeida", "Sao Luis", "Centro", "2.5", "CBO: 5162-10/MA", "Tarde", Category.CUIDADOR, "asset/cuidador/cuidador2.jpg", false),
    Doctor("Mariana Goncalves Oliveira", "Sao Luis", "Angelim", "2.5", "CBO: 5162-10/MA", "Tarde", Category.CUIDADOR, "asset/cuidador/cuidador3.jpg", false),
    Doctor("Gabrielly Santos Oliveira", "Sao Luis", "Turu", "2.5", "CBO: 5162-10/MA", "Manhã", Category.CUIDADOR, "asset/cuidador/cuidador4.jpg", true),
    Doctor("Sarah Pinto Gomes", "Sao Luis", "Anil", "2.5", "CBO: 5162-10/MA", "Tarde", Category.CUIDADOR, "asset/cuidador/cuidador5.jpg", true),
    Doctor("Gabriel Lima Araujo", "Sao Luis", "Cohab", "2.5", "CBO: 5162-10/MA", "Manhã", Category.CUIDADOR, "asset/cuidador/cuidador6.jpg", false),
    Doctor("Luis Sousa Souza", "Sao Luis", "Cohab", "2.5", "CBO: 5162-10/MA", "Tarde", Category.CUIDADOR, "asset/cuidador/cuidador7.jpg", true),

    Doctor("Mariana Pereira Ribeiro", "Sao Luis", "Cohab", "2.5", "CRM: 171820 MA", "Manhã", Category.GERIATRA, "asset/geriatras/geriatra1.jpg", true),
    Doctor("Isabelle Dias Carvalho", "Sao Luis", "Centro", "2.5", "CRM: 211820 MA", "Manhã", Category.GERIATRA, "asset/geriatras/geriatra2.jpg", false),
    Doctor("Bruno Costa Gomes", "Sao Luis", "Anil", "2.5", "CRM: 251820 MA", "Manhã", Category.GERIATRA, "asset/geriatras/geriatra3.jpg", false),
    Doctor("Diogo Goncalves Azevedo", "Sao Luis", "Centro", "2.5", "CRM: 341820 MA", "Tarde", Category.GERIATRA, "asset/geriatras/geriatra4.jpg", true),
    Doctor("Luan Cunha Melo", "Sao Luis", "Angelim", "2.5", "CRM: 441820 MA", "Manhã", Category.GERIATRA, "asset/geriatras/geriatra5.jpg", true),
    Doctor("Danilo Ribeiro Martins", "Sao Luis", "Turu", "2.5", "CRM: 551820 MA", "Tarde", Category.GERIATRA, "asset/geriatras/geriatra6.jpg", false),
    Doctor("Beatriz Ferreira Carvalho", "Sao Luis", "Cohab", "2.5", "CRM: 661820 MA", "Manhã", Category.GERIATRA, "asset/geriatras/geriatra7.jpg", true),
    Doctor("Gustavo Lima Fernandes", "Sao Luis", "Anil", "2.5", "CRM: 771820 MA", "Tarde", Category.GERIATRA, "asset/geriatras/geriatra8.jpg", true),

    Doctor("Fabio Cunha Barbosa", "Sao Luis", "St Rosa", "2.5", "COREN: MA 424646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro1.jpg", true),
    Doctor("Yasmin Ferreira Cunha", "Sao Luis", "Turu", "2.5", "COREN: MA 124646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro2.jpg", false),
    Doctor("Beatrice Dias Costa", "Sao Luis", "Vinhais", "2.5", "COREN: MA 224646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro3.jpg", false),
    Doctor("Luiza Rocha Costa", "Sao Luis", "Calhau", "2.5", "COREN: MA 324646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro4.jpg", true),
    Doctor("Emilly Goncalves Pinto", "Sao Luis", "Vinhais", "2.5", "COREN: MA 524646", "Tarde", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro5.jpg", true),
    Doctor("Agatha Sousa Castro", "Sao Luis", "Turu", "2.5", "COREN: MA 624646", "Tarde", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro6.jpg", false),
    Doctor("Miguel Alves Martins", "Sao Luis", "Cohab", "2.5", "COREN: MA 724646", "Tarde", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro7.jpg", true),
    Doctor("Laura Cardoso Almeida", "Sao Luis", "Barreto", "2.5", "COREN: MA 824646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro8.jpg", true),
    Doctor("Fernanda Cardoso Pinto", "Sao Luis", "Cohab", "2.5", "COREN: MA 924646", "Tarde", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro9.jpg", true),
    Doctor("Matheus Rodrigues Alves", "Sao Luis", "Anil", "2.5", "COREN: MA 124646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro10.jpg", false),
    Doctor("Julia Almeida Araujo", "Sao Luis", "Angelim", "2.5", "COREN: MA 234646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro11.jpg", false),
    Doctor("Carlos Cunha Cavalcanti", "Sao Luis", "Centro", "2.5", "COREN: MA 344646", "Manhã", Category.ENFERMEIRO, "asset/enfermeiro/enfermeiro12.jpg", true),
  ];
}