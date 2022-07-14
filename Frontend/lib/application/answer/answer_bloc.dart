import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:please/domain/answer/answer_failure.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/infrastructure/answer/answer_repository_impl.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:please/infrastructure/auth/shared_preference_repository.dart';
import '../../../domain/questions/value_objects.dart';
import '../../domain/answer/answer_model.dart';

part 'answer_event.dart';
part 'answer_state.dart';
part 'answer_bloc.freezed.dart';

@injectable
class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final AnswerRepositoryImpl answerRepository;

  AnswerBloc({required this.answerRepository}) : super(AnswerState.initial()) {
    on<AnswerDescriptionChanged>(_onAnswerDescriptionChanged);
    on<PostNewAnswerPressed>(_onPostNewAnswerPressed);
    on<UpdateAnswerPressed>(_onUpdateAnswerPressed);
    on<DeleteAnswerPressed>(_onDeleteAnswerPressed);
  }

  void _onAnswerDescriptionChanged(
      AnswerDescriptionChanged event, Emitter<AnswerState> emit) {
    emit(state.copyWith(
      isAnswerSaveSuccess: false,
      isAnswerUpdateSuccess: false,
      isAnswerDeleteSuccess: false,
      description: QuestionDescription(event.description),
      answerFailOrSuccess: none(),
    ));
  }

  void _onPostNewAnswerPressed(
      PostNewAnswerPressed event, Emitter<AnswerState> emit) async {
    Either<AnswerFailure, Question>? failureOrSuccess;

    final isDescriptionValid = state.description.isValid();
    if (isDescriptionValid) {
      emit(state.copyWith(
        isAnswerSaveSuccess: false,
        isSubmitting: true,
        answerFailOrSuccess: none(),
      ));
      final token = await SharedPreferenceRepository().getSavedUserToken();
      failureOrSuccess = await answerRepository.postAnswer(
          questionId: event.questionId,
          description: state.description,
          token: token);
    }
    if (failureOrSuccess is Right) {
      emit(state.copyWith(
        isAnswerSaveSuccess: true,
        answerFailOrSuccess: optionOf(failureOrSuccess),
      ));
    }
    emit(state.copyWith(
      isAnswerSaveSuccess: false,
      isSubmitting: false,
      showErrorMessages: true,
      answerFailOrSuccess: optionOf(failureOrSuccess),
    ));
  }

  void _onUpdateAnswerPressed(
      UpdateAnswerPressed event, Emitter<AnswerState> emit) async {
    Either<AnswerFailure, Question>? failureOrSuccess;
    final isDescriptionValid = state.description.isValid();
    if (isDescriptionValid) {
      emit(state.copyWith(
        isSubmitting: true,
        answerFailOrSuccess: none(),
      ));
      final token = await SharedPreferenceRepository().getSavedUserToken();
      Answer answer = event.answer;
      answer.description = state.description.getOrCrash();
      failureOrSuccess = await answerRepository.updateAnswer(token, answer);
    }

    if (failureOrSuccess is Right) {
      emit(state.copyWith(
          isAnswerUpdateSuccess: true,
          answerFailOrSuccess: optionOf(failureOrSuccess)));
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      answerFailOrSuccess: optionOf(failureOrSuccess),
    ));
  }

  void _onDeleteAnswerPressed(
      DeleteAnswerPressed event, Emitter<AnswerState> emit) async {
    Either<AnswerFailure, Question>? failureOrSuccess;

    final token = await SharedPreferenceRepository().getSavedUserToken();

    failureOrSuccess = await answerRepository.deleteAnswer(
        questionId: event.questionId, answerId: event.answerId, token: token);

    if (failureOrSuccess is Right) {
      emit(state.copyWith(
        isAnswerDeleteSuccess: true,
        answerFailOrSuccess: optionOf(failureOrSuccess),
      ));
    }

    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      answerFailOrSuccess: optionOf(failureOrSuccess),
    ));
  }
}
