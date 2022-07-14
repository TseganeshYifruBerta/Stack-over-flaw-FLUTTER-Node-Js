part of 'answer_bloc.dart';

@freezed
abstract class AnswerEvent with _$AnswerEvent {
  const factory AnswerEvent.answerDescriptionChanged(String description) =
      AnswerDescriptionChanged;

  const factory AnswerEvent.postNewAnswer(String questionId) = PostNewAnswerPressed;
  const factory AnswerEvent.updateAnswer(Answer answer) = UpdateAnswerPressed;
  const factory AnswerEvent.deleteAnswer({
    required String questionId,
    required String answerId
  }) = DeleteAnswerPressed;
}
