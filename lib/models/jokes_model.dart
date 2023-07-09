class JokesModel {
  final String setup;
  final String punchline;
  final String type;

  JokesModel({required this.setup, required this.punchline, required this.type});

  factory JokesModel.fromJson(Map<String, dynamic> json) {
    return JokesModel(
      setup: json['setup'],
      punchline: json['punchline'],
      type: json['type'],
    );
  }
}