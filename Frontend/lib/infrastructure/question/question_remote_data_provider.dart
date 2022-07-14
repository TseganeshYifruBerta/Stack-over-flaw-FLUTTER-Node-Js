import 'dart:convert';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/domain/questions/question_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:please/domain/questions/value_objects.dart';
import '../../domain/auth/response_model.dart';
import 'package:http/http.dart' as http;
import '../../domain/questions/value_objects.dart' as hola;
import 'question_repository.dart';

class QuestionRemoteDataProvider implements QuestionRepository {
  @override
  Future<Either<QuestionFailure, Question>>? deleteQuestion(
      String id, String token) async {
    String deletequestions = "http://localhost:8080/api/questions/delete/$id";

    var res = await http.delete(
      Uri.parse(deletequestions),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods':
            'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
        'Access-Control-Allow-Headers':
            'X-Requested-With,content-type', // If needed
        'Access-Control-Allow-Credentials': 'true',
        'x-auth-token': token
      },
    );
    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      Question question = Question.fromJson(data);
      return right(question);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse userResponse = ErrorReponse.fromJson(data);
      if (userResponse.message == 'Access denied, invalid token.') {
        return left(const QuestionFailure.accessDenied());
      }
    }
    return left(const QuestionFailure.serverError());
  }

  @override
  Future<Either<QuestionFailure, List<Question>>>? fetchAllQuestion() async {
    String allquestions = "http://localhost:8080/api/questions";

    var res = await http.get(
      Uri.parse(allquestions),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8'
      },
    );

    List<Question> questions;

    if (res.statusCode == 200) {
      Iterable l = json.decode(res.body);
      questions =
          List<Question>.from(l.map((model) => Question.fromJson(model)));
      return right(questions);
    } else {
      return left(const QuestionFailure.serverError());
    }
  }

  @override
  Future<Either<QuestionFailure, Question>>? getQuestion(String id) async {
    String getQuestion = "http://localhost:8080/api/questions/$id";

    var res = await http.post(
      Uri.parse(getQuestion),
      headers: <String, String>{
        'Context-Type': 'application/json;charSet=UTF-8',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods':
            'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
        'Access-Control-Allow-Headers':
            'X-Requested-With,content-type', // If needed
        'Access-Control-Allow-Credentials': 'true',
      },
    );

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      Question question = Question.fromJson(data);
      return right(question);
    } else {
      return left(const QuestionFailure.serverError());
    }
  }

  @override
  Future<Either<QuestionFailure, Question>>? updateQuestion(
      String token, Question question) async {
    String updatequestion =
        "http://localhost:8080/api/questions/edit/${question.id}";

    var res =
        await http.put(Uri.parse(updatequestion), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods':
          'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
      'Access-Control-Allow-Headers':
          'X-Requested-With,content-type', // If needed
      'Access-Control-Allow-Credentials': 'true',
      'x-auth-token': token
    }, body: <String, String>{
      'title': question.title,
      'description': question.description
    });

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      Question question = Question.fromJson(data);
      return right(question);
    } 
    else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse userResponse = ErrorReponse.fromJson(data);
      if (userResponse.message == 'Access denied, invalid token.') {
        return left(const QuestionFailure.accessDenied());
      }
    }
    return left(const QuestionFailure.serverError());
  }

  @override
  Future<Either<QuestionFailure, Question>>? postQuestion(
      {required hola.QuestionTitle title,
      required QuestionDescription description,
      required String token}) async {
    final titleSte = title.getOrCrash();
    final descriptionStr = description.getOrCrash();

    String addquestion = "http://localhost:8080/api/questions/add";

    var res = await http.post(Uri.parse(addquestion), headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods':
          'GET, POST, OPTIONS, PUT, PATCH, DELETE', // If needed
      'Access-Control-Allow-Headers':
          'X-Requested-With,content-type', // If needed
      'Access-Control-Allow-Credentials': 'true',
      'x-auth-token': token
    }, body: <String, String>{
      'title': titleSte,
      'description': descriptionStr
    });

    if (res.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(res.body);
      Question question = Question.fromJson(data);
      return right(question);
    } else {
      final Map<String, dynamic> data = json.decode(res.body);
      ErrorReponse userResponse = ErrorReponse.fromJson(data);
      if (userResponse.message == 'Access denied, invalid token.') {
        return left(const QuestionFailure.accessDenied());
      }
    }
    return left(const QuestionFailure.serverError());
  }
}
