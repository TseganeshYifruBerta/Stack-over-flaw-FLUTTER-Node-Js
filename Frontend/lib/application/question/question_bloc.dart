import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:please/application/question/question_event.dart';
import 'package:please/application/question/question_state.dart';
import 'package:please/domain/auth/value_objects.dart';
import 'package:please/domain/questions/question_failure.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/domain/questions/value_objects.dart';
import 'package:please/infrastructure/question/question_repository_impl.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QuestionRepositoryImpl questionRepository;
  QuestionBloc(this.questionRepository) : super(QuestionNotLoaded()) {
    on<LoadAllQuestionsEvent>(_onLoadAllQuestions);
    on<GetQuestionEvent>(_onGetQuestionEvent);
  }

  void _onLoadAllQuestions(
      QuestionEvent event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());

    final questions = await questionRepository.fetchAllQuestion();

    questions?.fold((exception) => null, (questions) {
      emit(QuestionLoaded(questions));
    });
  }

  void _onGetQuestionEvent(
      GetQuestionEvent event, Emitter<QuestionState> emit) async {
    emit(QuestionLoading());

    final questions = await questionRepository.getQuestion(event.id);
    questions?.fold((exception) => throw exception, (question) {
      emit(GetQuestionLoaded(question));
    });
  }
}
