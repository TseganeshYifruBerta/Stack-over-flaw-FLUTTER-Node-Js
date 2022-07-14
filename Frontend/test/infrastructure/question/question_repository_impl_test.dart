import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:please/domain/auth/userModel.dart';
import 'package:please/domain/questions/question_failure.dart';
import 'package:please/domain/questions/question_model.dart';
import 'package:please/domain/questions/value_objects.dart';
import 'package:please/infrastructure/infrastructure.dart';
import 'package:please/presentation/routes/routes.dart';

class MockQuestionRemoteProvider extends Mock
    implements QuestionRemoteDataProvider {}

void main() {
  late QuestionRepositoryImpl questionRepositoryImpl;
  late MockQuestionRemoteProvider mockQuestionRemoteProvider;

  setUp(() {
    mockQuestionRemoteProvider = MockQuestionRemoteProvider();
    questionRepositoryImpl = QuestionRepositoryImpl(mockQuestionRemoteProvider);
  });
  final title = QuestionTitle("title");
  final description = QuestionDescription('description');
  final token = "token";

  final question = Question(
      id: 'id',
      authorId: 'authorId',
      authorName: 'authorName',
      title: 'title',
      answer: [],
      description: 'description',
      dateTime: DateTime.now());

  Either<QuestionFailure, Question> responseModel = Right(question);

  group('post new question', () {
    test(
        'should return 200 for posting a new question if the user is logged in.',
        () async {
      when(mockQuestionRemoteProvider.postQuestion(
              title: title, description: description, token: token))
          .thenAnswer((_) async => responseModel);

      final result = await questionRepositoryImpl.postQuestion(
          title: title, description: description, token: token);

      verify(mockQuestionRemoteProvider.postQuestion(
          title: title, description: description, token: token));

      expect(result, responseModel);
    });

    test(
        'should return access denied when the user is not logged in or invalid token',
        () async {
      when(mockQuestionRemoteProvider.postQuestion(
              title: title, description: description, token: token))
          .thenAnswer((_) async => const Left(QuestionFailure.accessDenied()));

      final result = await questionRepositoryImpl.postQuestion(
          title: title, description: description, token: token);

      verify(mockQuestionRemoteProvider.postQuestion(
          title: title, description: description, token: token));

      expect(result, const Left(QuestionFailure.accessDenied()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockQuestionRemoteProvider.postQuestion(
              title: title, description: description, token: token))
          .thenAnswer((_) async => const Left(QuestionFailure.serverError()));

      final result = await questionRepositoryImpl.postQuestion(
          title: title, description: description, token: token);

      verify(mockQuestionRemoteProvider.postQuestion(
          title: title, description: description, token: token));

      expect(result, const Left(QuestionFailure.serverError()));
    });
  });

  group('delete a question', () {
    test(
        'should return 200 for deleting a question if the user is the one who create the question',
        () async {
      when(mockQuestionRemoteProvider.deleteQuestion('id', token))
          .thenAnswer((_) async => responseModel);

      final result = await questionRepositoryImpl.deleteQuestion('id', token);

      verify(mockQuestionRemoteProvider.deleteQuestion('id', token));
      expect(result, responseModel);
    });

    test(
        'should return access denied when the user is not allowed to delete the question',
        () async {
      when(mockQuestionRemoteProvider.deleteQuestion('id', token))
          .thenAnswer((_) async => const Left(QuestionFailure.accessDenied()));

      final result = await questionRepositoryImpl.deleteQuestion('id', token);

      verify(mockQuestionRemoteProvider.deleteQuestion('id', token));

      expect(result, const Left(QuestionFailure.accessDenied()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockQuestionRemoteProvider.deleteQuestion('id', token))
          .thenAnswer((_) async => const Left(QuestionFailure.serverError()));

      final result = await questionRepositoryImpl.deleteQuestion('id', token);

      verify(mockQuestionRemoteProvider.deleteQuestion('id', token));
      expect(result, const Left(QuestionFailure.serverError()));
    });
  });

  group('fetch all questions', () {

    List<Question> questionsModel = [question];

    Either<QuestionFailure, List<Question>> questions = Right(questionsModel);
    test('should response 200 and return a list of questions', () async {
      when(mockQuestionRemoteProvider.fetchAllQuestion())
          .thenAnswer((_) async => questions);

      final result = await questionRepositoryImpl.fetchAllQuestion();

      verify(mockQuestionRemoteProvider.fetchAllQuestion());
      expect(result, questions);
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockQuestionRemoteProvider.fetchAllQuestion())
          .thenAnswer((_) async => const Left(QuestionFailure.serverError()));

      final result = await questionRepositoryImpl.fetchAllQuestion();

      verify(mockQuestionRemoteProvider.fetchAllQuestion());
      expect(result, const Left(QuestionFailure.serverError()));
    });
  });


  group('get a question with id', () {
    test('should response 200 and return a question', () async {
      when(mockQuestionRemoteProvider.getQuestion('id'))
          .thenAnswer((_) async => Right(question));

      final result = await questionRepositoryImpl.getQuestion('id');

      verify(mockQuestionRemoteProvider.getQuestion('id'));
      expect(result, responseModel);
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockQuestionRemoteProvider.getQuestion('id'))
          .thenAnswer((_) async => const Left(QuestionFailure.serverError()));

      final result = await questionRepositoryImpl.getQuestion('id');

      verify(mockQuestionRemoteProvider.getQuestion('id'));
      expect(result, const Left(QuestionFailure.serverError()));
    });
  });

   group('update a question', () {
    test(
        'should return 200 for updating a question if the user is the one who create the question',
        () async {
      when(mockQuestionRemoteProvider.updateQuestion(token, question))
          .thenAnswer((_) async => responseModel);

      final result = await questionRepositoryImpl.updateQuestion(token, question);

      verify(mockQuestionRemoteProvider.updateQuestion(token, question));
      expect(result, responseModel);
    });

    test(
        'should return access denied when the user is not allowed to update the question',
        () async {
      when(mockQuestionRemoteProvider.updateQuestion(token, question))
          .thenAnswer((_) async => const Left(QuestionFailure.accessDenied()));

      final result = await questionRepositoryImpl.updateQuestion(token, question);

      verify(mockQuestionRemoteProvider.updateQuestion(token, question));

      expect(result, const Left(QuestionFailure.accessDenied()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockQuestionRemoteProvider.updateQuestion(token, question))
          .thenAnswer((_) async => const Left(QuestionFailure.serverError()));

      final result = await questionRepositoryImpl.updateQuestion(token, question);

      verify(mockQuestionRemoteProvider.updateQuestion(token, question));
      expect(result, const Left(QuestionFailure.serverError()));
    });
  });

}
