class Pizza {
  final String id;
  final String nom;
  final String desc;
  final bool vegetariana;
  final List<String> alergens;
  final String? img;
  final double preu;

  Pizza({
    required this.id,
    required this.nom,
    required this.desc,
    required this.vegetariana,
    required this.alergens,
    this.img,
    required this.preu,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'],
      nom: json['nom'],
      desc: json['desc'],
      vegetariana: json['vegetariana'],
      alergens: List<String>.from(json['alergens']),
      img: json['img'],
      preu: json['preu'].toDouble(),
    );
  }
}
