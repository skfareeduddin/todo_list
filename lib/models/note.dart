import 'dart:convert';

class Note {
  String title;
  String content;
  String timeStamp;

  Note({
    required this.title,
    required this.content,
    required this.timeStamp,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      content: map['content'],
      timeStamp: map['timeStamp'],
    );
  }

  factory Note.fromJson(String json) {
    return Note.fromMap(jsonDecode(json));
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'timeStamp': timeStamp,
    };
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
