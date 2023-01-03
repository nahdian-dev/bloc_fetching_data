class JokesModel {
  int id;
  String setup;
  String punchline;

  JokesModel({required this.id, required this.setup, required this.punchline});

  factory JokesModel.fromJson(Map<String, dynamic> json) {
    return JokesModel(
      id: json['id'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
