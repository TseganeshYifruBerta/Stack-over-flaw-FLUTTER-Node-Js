import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_failure.freezed.dart';

@freezed
abstract class QuestionFailure with _$QuestionFailure {
  const factory QuestionFailure.cancelledByUser() = CancelledByUser;
  const factory QuestionFailure.serverError() = ServerError;
  const factory QuestionFailure.accessDenied() = AccessDenied;
  
}
