import 'package:equatable/equatable.dart';
import 'package:please/domain/answer/answer_model.dart';

class Question extends Equatable {
  String id;
  String authorId;
  String authorName;
  String title;
  String description;
  DateTime dateTime;
  List<Answer> answer;

  String get getId => id;
  String get getAuthorName => authorName;
  String get getAuthorId => authorId;
  String get getTitle => title;
  String get getDscription => description;
  DateTime get getDateTime => dateTime;

  Question(
      {required this.id,
      required this.authorId,
      required this.authorName,
      required this.title,
      required this.answer,
      required this.description,
      required this.dateTime});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
        id: json['_id'],
        authorId: json['userId'],
        authorName: json['authorName'],
        title: json['title'],
        description: json['description'],
        dateTime: DateTime.parse(json['dateOfQuestion']),
        answer: List<Answer>.from(
          (json['answers'].map((model) => Answer.fromJson(model))),
        ));
  }
  // Iterable l = json.decode(res.body);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': authorId,
        'authorName': authorName,
        'title': title,
        'description': description,
        'dateOfQuestion': dateTime,
        'answers': answer
      };

  @override
  List<Object?> get props =>
      [id, authorId, authorName, title, description, dateTime, answer];
}
