import 'package:dartz/dartz.dart';
import 'package:please/domain/questions/value_objects.dart';

import '../../domain/questions/question_failure.dart';
import '../../domain/questions/question_model.dart';

abstract class QuestionRepository {
  Future<Either<QuestionFailure, Question>>? postQuestion(
      {required QuestionTitle title,
      required QuestionDescription description,
      required String token});

  Future<Either<QuestionFailure, Question>>? updateQuestion(
      String token, Question question);
  Future<Either<QuestionFailure, Question>>? getQuestion(String id);
  Future<Either<QuestionFailure, Question>>? deleteQuestion(
      String id, String token);
  Future<Either<QuestionFailure, List<Question>>>? fetchAllQuestion();
}
