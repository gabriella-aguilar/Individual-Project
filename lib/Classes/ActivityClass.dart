
class Activity {
  final String date;
  final String title;
  final int duration;
  final String comments;

  Activity({this.date, this.title, this.duration, this.comments});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'title': title,
      'duration': duration,
      'comments': comments
    };
  }

  String getTitle(){return title;}

  int getDuration(){return duration;}

  String getDate(){return date;}

  String getComments(){return comments;}


}