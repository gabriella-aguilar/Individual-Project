class Comments{
  final String comment;
  final String date;

  Comments({this.date,this.comment});

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
      'date': date
    };
  }

  String getComment(){return this.comment;}
  String getDate(){return this.date;}
}