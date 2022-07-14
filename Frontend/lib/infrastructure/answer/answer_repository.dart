import 'package:dartz/dartz.dart';
import 'package:please/domain/answer/answer_failure.dart';
import 'package:please/domain/answer/answer_model.dart';
import 'package:please/domain/questions/value_objects.dart';

import '../../domain/questions/question_model.dart';

abstract class AnswerRepository {
  
  Future<Either<AnswerFailure, Question>>? postAnswer(
      {required String questionId,
      required QuestionDescription description,
      required String token});

  Future<Either<AnswerFailure, Question>>? updateAnswer(
      String token, Answer answer);

  Future<Either<AnswerFailure, Question>>? deleteAnswer(
      {required String questionId,
      required String answerId,
      required String token});
}
