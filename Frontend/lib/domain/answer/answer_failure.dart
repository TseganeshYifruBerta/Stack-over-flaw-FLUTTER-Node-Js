
import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_failure.freezed.dart';

@freezed
abstract class AnswerFailure with _$AnswerFailure {
  const factory AnswerFailure.cancelledByUser() = CancelledByUser;
  const factory AnswerFailure.serverError() = ServerError;
  const factory AnswerFailure.accessDenied() = AccessDenied;
}
