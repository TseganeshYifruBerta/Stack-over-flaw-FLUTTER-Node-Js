// import 'dart:async';
// import 'package:please/domain/questions/value_objects.dart';
// import 'package:please/domain/questions/question_model.dart';
// import 'package:please/domain/questions/question_failure.dart';
// import 'package:dartz/dartz.dart';
// import 'package:please/infrastructure/auth/user_data_provider.dart';
// import 'package:please/infrastructure/infrastructure.dart';

// import 'database_helper.dart';

// // import '../models/models.dart';
// // 2
// class SqliteRepository extends QuestionDataProvider {
//  final dbHelper = DatabaseHelper.instance;

//   @override
//   Future<Either<QuestionFailure, Unit>> deleteQuestion(String id, String token) {
//     // TODO: implement deleteQuestion
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, List<Question>>> fetchAllQuestion() {
//     // TODO: implement fetchAllQuestion
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, Question>> getQuestion(String id) {
//     // TODO: implement getQuestion
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, Unit>> postQuestion({required QuestionTitle title, required Description description, required String token}) {
//     // TODO: implement postQuestion
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<QuestionFailure, Unit>> updateQuestion(String token, Question question) {
//     // TODO: implement updateQuestion
//     throw UnimplementedError();
//   }
// }

//  // 3
  
//   // TODO: Add methods to use dbHelper here

//   @override
//   Future<List<Question>> findAllQuestions() {
//     return dbHelper.findAllQuestions();
//   }

//   @override
//   Stream<List<Question>> watchAllQuestions() {
//     return dbHelper.watchAllQuestions();
//   }

//   @override
//   Stream<List<Answer>> watchAllAnswers() {
//     return dbHelper.watchAllAnswers();
//   }

//   @override
//   Future<Question> findQuestionById(int id) {
//     return dbHelper.findQuestionById(id);
//   }

 

 
// // TODO: Add insertQuestion here
//   @override
//   Future<int> insertQuestion(Question question) {
//     // 1
//     return Future(() async {
//       // 2
//       final id = await dbHelper.insertQuestion(question);
//       // 3
//       question.id = id;
//       if (question.answers != null) {
//         question.answers!.forEach((answer) {
//           // 4
//           answer.questionId = id;
//         });
//         // 5
//         insertAnswers(question.answers!);
//       }
//       // 6
//       return id;
//     });
//   }
// // TODO: insertAnswers

//   @override
//   Future<List<int>> insertAnswers(List<Answer> answers) {
//     return Future(() async {
//       if (answers.length != 0) {
//         // 1
//         final answerIds = <int>[];
//         // 2
//         await Future.forEach(answers, (Answer answer) async {
//           // 3
//           final futureId = await dbHelper.insertAnswer(answer);
//           answer.id = futureId;
//           // 4
//           answerIds.add(futureId);
//         });
//         // 5
//         return Future.value(answerIds);
//       } else {
//         return Future.value(<int>[]);
//       }
//     });
//   }
// // TODO: Delete methods go here

//   @override
//   Future<void> deleteQuestion(Question question) {
//     // 1
//     dbHelper.deleteQuestion(question);
//     // 2
//     if (question.id != null) {
//       deleteQuestionAnswers(question.id);
//     }
//     return Future.value();
//   }

//   @override
//   Future<void> deleteAnswer(Answer answer) {
//     dbHelper.deleteAnswer(answer);
//     // 3
//     return Future.value();
//   }

  

//   @override
//   Future<void> deleteQuestionAnswers(int questionId) {
//     // 5
//     dbHelper.deleteQuestionAnswers(questionId);
//     return Future.value();
//   }
// // TODO: initialize and close methods go here

//   Future init() async {
//     // 1
//     await dbHelper.database;
//     return Future.value();
//   }

//   @override
//   void close() {
//     // 2
//     dbHelper.close();
//   }
