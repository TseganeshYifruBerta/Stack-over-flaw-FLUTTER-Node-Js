import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:please/domain/answer/answer_model.dart';
import 'package:please/domain/answer/answer_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:please/infrastructure/answer/answer_repository.dart';
import '../../domain/domain.dart';

class AnswerRemoteDataProvider implements AnswerRepository {
  @override
  Future<Either<AnswerFailure, Question>>? deleteAnswer(
      {required String questionId,
      required String answerId,
      required String token}) async {
    String deleteAnswer =
        "http://localhost:8080/api/answers/delete/$questionId/$answerId";

    var res =
        await http.delete(Uri.parse(deleteAnswer), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods':
          'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
      'Access-Control-Allow-Headers':
          'X-Requested-With,content-type', // If needed
      'Access-Control-Allow-Credentials': 'true',
      'x-auth-token': token
    }, body: <String, String>{});

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      final question = Question.fromJson(data);
      return right(question);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse userResponse = ErrorReponse.fromJson(data);
      if (userResponse.message == 'Access denied, invalid token.') {
        return left(const AnswerFailure.accessDenied());
      }
    }
    return left(const AnswerFailure.serverError());
  }

  @override
  Future<Either<AnswerFailure, Question>>? postAnswer(
      {required String questionId,
      required QuestionDescription description,
      required String token}) async {
    String addAnswer = "http://localhost:8080/api/answers/add/$questionId";

    var res = await http.post(Uri.parse(addAnswer), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods':
          'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
      'Access-Control-Allow-Headers':
          'X-Requested-With,content-type', // If needed
      'Access-Control-Allow-Credentials': 'true',
      'x-auth-token': token
    }, body: <String, String>{
      'description': description.getOrCrash()
    });

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      final question = Question.fromJson(data);
      return right(question);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse userResponse = ErrorReponse.fromJson(data);
      if (userResponse.message == 'Access denied, invalid token.') {
        return left(const AnswerFailure.accessDenied());
      }
    }
    return left(const AnswerFailure.serverError());
  }

  @override
  Future<Either<AnswerFailure, Question>>? updateAnswer(
      String token, Answer answer) async {
    String updateAnswer = "http://localhost:8080/api/answers/edit/${answer.id}";

    var res = await http.put(Uri.parse(updateAnswer), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods':
          'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
      'Access-Control-Allow-Headers':
          'X-Requested-With,content-type', // If needed
      'Access-Control-Allow-Credentials': 'true',
      'x-auth-token': token
    }, body: <String, String>{
      'description': answer.description
    });

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      final question = Question.fromJson(data);
      return right(question);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse userResponse = ErrorReponse.fromJson(data);
      if (userResponse.message == 'Access denied, invalid token.') {
        return left(const AnswerFailure.accessDenied());
      }
    }
    return left(const AnswerFailure.serverError());
  }
}
