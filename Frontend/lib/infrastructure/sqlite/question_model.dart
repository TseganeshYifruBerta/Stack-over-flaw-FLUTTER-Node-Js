import 'package:equatable/equatable.dart';
import 'package:please/domain/answer/answer_model.dart';

class QuestionModel extends Equatable {
  String id;
  String authorId;
  String authorName;
  String title;
  String description;
  DateTime dateTime;

  String get getId => id;
  String get getAuthorName => authorName;
  String get getAuthorId => authorId;
  String get getTitle => title;
  String get getDscription => description;
  DateTime get getDateTime => dateTime;

  QuestionModel(
      {required this.id,
      required this.authorId,
      required this.authorName,
      required this.title,
      required this.description,
      required this.dateTime});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        id: json['questionId'],
        authorId: json['authorId'],
        authorName: json['authorName'],
        title: json['title'],
        description: json['description'],
        dateTime: DateTime.parse(json['dateTime']),
  
        );
  }
  // Iterable l = json.decode(res.body);

  Map<String, dynamic> toJson() => {
        'questionId': id,
        'authorId': authorId,
        'authorName': authorName,
        'title': title,
        'description': description,
        'dateTime': dateTime,
      };

  @override
  List<Object?> get props =>
      [id, authorId, authorName, title, description, dateTime];
}
