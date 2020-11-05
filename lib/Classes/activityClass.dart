class Activity {
  String _title;
  int _duration;
  String _comments;

  Activity(String t, int d, String c){
    _title=t;
    _duration=d;
    _comments=c;
  }

  String getTitle(){return _title;}
  void setTitle(String t){_title = t;}

  int getDuration(){return _duration;}
  void setDuration(int d){_duration=d;}

  String getComments(){return _comments;}
  void setComments(String c){_comments=c;}

}