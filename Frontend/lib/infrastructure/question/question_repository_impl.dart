import 'package:dartz/dartz.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/domain/questions/question_failure.dart';
import 'package:please/domain/questions/value_objects.dart';

import 'question_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRepository questionDataProvider;

  QuestionRepositoryImpl(this.questionDataProvider);
  
  @override
  Future<Either<QuestionFailure, Question>>? deleteQuestion(String id, String token){
    return questionDataProvider.deleteQuestion(id, token);
  }
  
  @override
  Future<Either<QuestionFailure, List<Question>>>? fetchAllQuestion() {
    return questionDataProvider.fetchAllQuestion();
  }
  
  @override
  Future<Either<QuestionFailure, Question>>? getQuestion(String id) {
    return questionDataProvider.getQuestion(id);
  }
  
  @override
  Future<Either<QuestionFailure, Question>>? postQuestion({required QuestionTitle title, required QuestionDescription description, required String token}) {
     return questionDataProvider.postQuestion(
        description: description, title: title, token: token);
  }
  
  @override
  Future<Either<QuestionFailure, Question>>? updateQuestion(String token, Question question) {
    return questionDataProvider.updateQuestion(token, question);
  }

  
}

