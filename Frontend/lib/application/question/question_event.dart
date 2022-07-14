import 'package:please/domain/auth/value_objects.dart';
import 'package:please/domain/questions/value_objects.dart';

abstract class QuestionEvent {}

class LoadAllQuestionsEvent extends QuestionEvent {}

class GetQuestionEvent extends QuestionEvent {
  final String id;

  GetQuestionEvent(this.id);
}
