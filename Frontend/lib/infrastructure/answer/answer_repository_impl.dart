import 'package:dartz/dartz.dart';
import 'package:please/domain/answer/answer_model.dart';
import 'package:please/domain/answer/answer_failure.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/domain/questions/value_objects.dart';
import 'package:please/infrastructure/answer/answer_repository.dart';

class AnswerRepositoryImpl implements AnswerRepository {
  final AnswerRepository answerRepository;

  AnswerRepositoryImpl(this.answerRepository);

  @override
  Future<Either<AnswerFailure, Question>>? deleteAnswer(
      {required String questionId,
      required String answerId,
      required String token}) {
    return answerRepository.deleteAnswer(
        questionId: questionId, answerId: answerId, token: token);
  }

  @override
  Future<Either<AnswerFailure, Question>>? postAnswer(
      {required String questionId,
      required QuestionDescription description,
      required String token}) {
    return answerRepository.postAnswer( questionId: questionId, description: description, token: token);
  }

  @override
  Future<Either<AnswerFailure, Question>>? updateAnswer(
      String token, Answer answer) {
    return answerRepository.updateAnswer(token, answer);
  }
}
