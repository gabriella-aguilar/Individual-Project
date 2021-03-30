class Meal{
  final String date;
  final String name;
  final int gluten;
  final int alcohol;
  final int sugar;
  final int meat;
  final int dairy;

  Meal({this.date, this.name, this.gluten, this.alcohol, this.sugar, this.meat, this.dairy});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'name': name,
      'gluten': gluten,
      'alcohol': alcohol,
      'sugar': sugar,
      'meat': meat,
      'dairy': dairy
    };
  }


  String getName(){return name;}


 int getGluten(){return gluten;}


  int getAlcohol(){return alcohol;}


  int getSugar(){return sugar;}

  String getDate(){return date;}

  int getMeat(){return meat;}


  int getDairy(){return dairy;}


}