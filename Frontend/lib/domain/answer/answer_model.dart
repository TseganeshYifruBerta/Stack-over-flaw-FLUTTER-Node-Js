import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  String id;
  String authorId;
  String authorName;
  String questionId;
  String description;
  DateTime dateTime;

  String get getId => id;
  String get getAuthorName => authorName;
  String get getAuthorId => authorId;
  String get getQuestionId => questionId;
  String get getDscription => description;
  DateTime get getDateTime => dateTime;

  Answer({required this.id, required this.authorId,required this.authorName, required this.questionId,
     required this.description, required this.dateTime});

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id:json['_id'],
      authorId: json['userId'],
      authorName: json['authorName'],
      questionId: json['questionId'],
      description: json['description'],
      dateTime: DateTime.parse(json['dateOfAnswer']),
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'userId': authorId,
        'authorName': authorName,
        'questionId': questionId,
        'description': description,
        'dateOfAnswer': dateTime
      };

  @override
  List<Object?> get props =>
      [id, authorId, authorName, questionId, description, dateTime];
}
