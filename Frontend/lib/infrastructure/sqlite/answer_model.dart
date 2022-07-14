// import 'package:equatable/equatable.dart';
// // Create a Ingredient from JSON data

// class Answer extends Equatable {
//   int id;
//   String questionId;
//   String answer;

//   int get getId => id;
//   String get getQuestionId => questionId;
//   String get getAnswer => answer;

//   Answer(this.id, this.questionId, this.answer);
//   factory Answer.fromJson(Map<String, dynamic> json) => Answer(
//         json['_id'],
//         json['questionId'],
//         json['answer'],
//       );
// // Convert our Ingredient to JSON to make it easier when you
// // store it in the database
//   Map<String, dynamic> toJson() => {
//         '_id': id,
//         'questionId': questionId,
//         'answer': answer,
//       };
//   @override
//   // TODO: implement props
//   List<Object?> get props => [id, questionId, answer];
// }
