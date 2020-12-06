class Tracking{
  final String name;

  Tracking({this.name});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  String getName(){return this.name;}
}