class Meal{
  String _name;
  bool _gluten;
  bool _alcohol;
  bool _sugar;
  bool _meat;
  bool _dairy;

  String getName(){return _name;}
  void setName(String n){_name=n;}

  bool getGluten(){return _gluten;}
  void setGluten(bool g){_gluten=g;}

  bool getAlcohol(){return _alcohol;}
  void setAlcohol(bool g){_alcohol=g;}

  bool getSugar(){return _sugar;}
  void setSugar(bool g){_sugar=g;}

  bool getMeat(){return _meat;}
  void setMeat(bool g){_meat=g;}

  bool getDairy(){return _dairy;}
  void setDairy(bool g){_dairy=g;}
}