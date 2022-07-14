import 'package:dartz/dartz.dart';
import 'package:please/domain/questions/question_failure.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/domain/questions/value_objects.dart';

abstract class QuestionState {
  Either<QuestionFailure, Question>? failureOrSuccess;
  late String errorMessage;

  late QuestionTitle title;
  late QuestionDescription description;
}

class QuestionNotLoaded extends QuestionState {}

class QuestionLoading extends QuestionState {}

class QuestionLoaded extends QuestionState {
  final List<Question> questions;

  QuestionLoaded(this.questions);
}

class GetQuestionLoaded extends QuestionState {
  final Question question;

  GetQuestionLoaded(this.question);
}

class NoQuestionLoaded extends QuestionState {}
