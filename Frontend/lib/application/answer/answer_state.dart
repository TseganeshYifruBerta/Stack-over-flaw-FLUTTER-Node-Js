part of 'answer_bloc.dart';

@freezed
abstract class AnswerState with _$AnswerState {
  const factory AnswerState({
    required QuestionDescription description,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isAnswerSaveSuccess,
    required bool isAnswerUpdateSuccess,
    required bool isAnswerDeleteSuccess,
    required Option<Either<AnswerFailure, Question>> answerFailOrSuccess,
  }) = _AnswerState;

  factory AnswerState.initial() => AnswerState(
        description: QuestionDescription(''),
        showErrorMessages: false,
        isSubmitting: false,
        isAnswerSaveSuccess: false,
        isAnswerUpdateSuccess: false,
        isAnswerDeleteSuccess: false,
        answerFailOrSuccess: none(),
      );
}
