part of 'question_form_bloc.dart';

@freezed
abstract class QuestionFormEvent with _$QuestionFormEvent {
  const factory QuestionFormEvent.titleChanged(String title) = TitleChanged;

  const factory QuestionFormEvent.descriptionChanged(String description) =
      DescriptionChanged;

  const factory QuestionFormEvent.postNewQuestion() = PostNewQuestionPressed;
  const factory QuestionFormEvent.updateQuestion(String id) =
      UpdateQuestionPressed;
      const factory QuestionFormEvent.deleteQuestion(String id) =
      DeleteQuestionPressed;

}
