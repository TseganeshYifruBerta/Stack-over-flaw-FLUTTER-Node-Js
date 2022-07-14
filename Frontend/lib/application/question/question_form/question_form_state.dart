part of 'question_form_bloc.dart';

@freezed
abstract class QuestionFormState with _$QuestionFormState {
  const factory QuestionFormState({
    required QuestionTitle title,
    required QuestionDescription description,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isQuestionSaveSuccess,
    required bool isQuestionDeleteSuccess,
    required Option<Either<QuestionFailure, Question>> questionFailOrSuccess,
  }) = _QuestionFormState;

  factory QuestionFormState.initial() => QuestionFormState(
        title: QuestionTitle(''),
        description: QuestionDescription(''),
        showErrorMessages: false,
        isSubmitting: false,
        isQuestionSaveSuccess: false,
        isQuestionDeleteSuccess: false,
        questionFailOrSuccess: none(),
      );
}

// class SignedUpSuccessful extends SignInFormState{}
