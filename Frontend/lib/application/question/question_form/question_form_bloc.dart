import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:please/application/auth/authentication_bloc.dart';
import 'package:please/domain/auth/auth_failure.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/infrastructure/auth/user_repository_impl.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:please/infrastructure/auth/shared_preference_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/questions/question_failure.dart';
import '../../../domain/questions/value_objects.dart';
import '../../../infrastructure/question/question_repository_impl.dart';

part 'question_form_event.dart';
part 'question_form_state.dart';
part 'question_form_bloc.freezed.dart';

@injectable
class QuestionFormBloc extends Bloc<QuestionFormEvent, QuestionFormState> {
  final QuestionRepositoryImpl questionRepository;

  QuestionFormBloc({required this.questionRepository})
      : super(QuestionFormState.initial()) {
    on<TitleChanged>(_onTitleChange);
    on<DescriptionChanged>(_onDescriptionChange);
    on<PostNewQuestionPressed>(_onPostNewQuestionPressed);
    on<UpdateQuestionPressed>(_onUpdateQuestionPressed);
    on<DeleteQuestionPressed>(_onDeleteQuestionPressed);
  }

  void _onTitleChange(TitleChanged event, Emitter<QuestionFormState> emit) {
    final title = QuestionTitle(event.title);
    emit(state.copyWith(
      title: QuestionTitle(event.title),
      questionFailOrSuccess: none(),
    ));
  }

  void _onDescriptionChange(
      DescriptionChanged event, Emitter<QuestionFormState> emit) {
    emit(state.copyWith(
      description: QuestionDescription(event.description),
      questionFailOrSuccess: none(),
      // authFailureOrSuccessOption: none(),
    ));
  }

  void _onPostNewQuestionPressed(
      PostNewQuestionPressed event, Emitter<QuestionFormState> emit) async {
    Either<QuestionFailure, Question>? failureOrSuccess;

    final isTitleValid = state.title.isValid();
    final isDescriptionValid = state.description.isValid();
    if (isTitleValid && isDescriptionValid) {
      emit(state.copyWith(
        isSubmitting: true,
        questionFailOrSuccess: none(),
      ));
      final token = await SharedPreferenceRepository().getSavedUserToken();
      failureOrSuccess = await questionRepository.postQuestion(
          title: state.title, description: state.description, token: token);
    }
    if (failureOrSuccess is Right) {
      emit(state.copyWith(
        isQuestionSaveSuccess: true,
      ));
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      questionFailOrSuccess: optionOf(failureOrSuccess),
    ));
  }

  void _onUpdateQuestionPressed(
      UpdateQuestionPressed event, Emitter<QuestionFormState> emit) async {
    Either<QuestionFailure, Question>? failureOrSuccess;
    final isTitleValid = state.title.isValid();
    final isDescriptionValid = state.description.isValid();
    if (isTitleValid && isDescriptionValid) {
      emit(state.copyWith(
        isSubmitting: true,
        questionFailOrSuccess: none(),
      ));
      final token = await SharedPreferenceRepository().getSavedUserToken();

      Question question = Question(
          id: event.id,
          authorId: 'authorId',
          authorName: "auhtorName",
          title: state.title.getOrCrash(),
          description: state.description.getOrCrash(),
          dateTime: DateTime.now(),
          answer: []);
      failureOrSuccess =
          await questionRepository.updateQuestion(token, question);
    }
    if (failureOrSuccess is Right) {
      emit(state.copyWith(
        isQuestionSaveSuccess: true,
      ));
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      questionFailOrSuccess: optionOf(failureOrSuccess),
    ));
  }

  void _onDeleteQuestionPressed(
      DeleteQuestionPressed event, Emitter<QuestionFormState> emit) async {
    Either<QuestionFailure, Question>? failureOrSuccess;

    final token = await SharedPreferenceRepository().getSavedUserToken();
    failureOrSuccess = await questionRepository.deleteQuestion(event.id, token);

    if (failureOrSuccess is Right) {
      emit(state.copyWith(
        isQuestionDeleteSuccess: true,
      ));
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      questionFailOrSuccess: optionOf(failureOrSuccess),
    ));
  }
}
