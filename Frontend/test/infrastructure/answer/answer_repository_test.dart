import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:please/domain/answer/answer_failure.dart';
import 'package:please/domain/answer/answer_model.dart';
import 'package:please/domain/domain.dart';
import 'package:please/domain/questions/value_objects.dart';
import 'package:please/infrastructure/answer/answer_repository.dart';
import 'package:please/infrastructure/answer/answer_remote_data_provider.dart';
import 'package:please/infrastructure/answer/answer_repository_impl.dart';

class MockAnswerRemoteProvider extends Mock
    implements AnswerRemoteDataProvider {}

void main() {
  late AnswerRepositoryImpl answerRepositoryImpl;
  late MockAnswerRemoteProvider mockAnswerRemoteProvider;

  setUp(() {
    mockAnswerRemoteProvider = MockAnswerRemoteProvider();
    answerRepositoryImpl = AnswerRepositoryImpl(mockAnswerRemoteProvider);
  });
  final description = QuestionDescription('description');
  const token = "token";
  const id = 'id';
  final time = DateTime.now();
  final questionModel = Question(
      id: 'id',
      authorId: 'authorId',
      authorName: 'authorName',
      title: 'title',
      answer: [],
      description: 'description',
      dateTime: time);

  final answerModel = Answer(
      id: 'id',
      authorId: 'authorId',
      authorName: 'authorName',
      questionId: 'questionId',
      description: 'description',
      dateTime: time);

  Either<AnswerFailure, Question> responseModel = Right(questionModel);

  group('post a new answer', () {
    test('should return 200 for posting a new answer if the user is logged in.',
        () async {
      when(mockAnswerRemoteProvider.postAnswer(
              questionId: id, description: description, token: token))
          .thenAnswer((_) async => responseModel);

      final result = await answerRepositoryImpl.postAnswer(
          questionId: id, description: description, token: token);

      verify(mockAnswerRemoteProvider.postAnswer(
          questionId: id, description: description, token: token));
      expect(result, responseModel);
    });

    test(
        'should return access denied when the user is not logged in or invalid token',
        () async {
      when(mockAnswerRemoteProvider.postAnswer(
              questionId: id, description: description, token: token))
          .thenAnswer((_) async => const Left(AnswerFailure.accessDenied()));

      final result = await answerRepositoryImpl.postAnswer(
          questionId: id, description: description, token: token);

      verify(mockAnswerRemoteProvider.postAnswer(
          questionId: id, description: description, token: token));

      expect(result, const Left(AnswerFailure.accessDenied()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockAnswerRemoteProvider.postAnswer(
              questionId: id, description: description, token: token))
          .thenAnswer((_) async => const Left(AnswerFailure.serverError()));

      final result = await answerRepositoryImpl.postAnswer(
          questionId: id, description: description, token: token);

      verify(mockAnswerRemoteProvider.postAnswer(
          questionId: id, description: description, token: token));

      expect(result, const Left(AnswerFailure.serverError()));
    });
  });

  group('delete answer', () {
    test(
        'should return 200 for deleting a answer if the user is the one who create the question',
        () async {
      when(mockAnswerRemoteProvider.deleteAnswer(
              questionId: id, answerId: 'ddd', token: token))
          .thenAnswer((_) async => responseModel);

      final result = await answerRepositoryImpl.deleteAnswer(
          questionId: id, answerId: 'ddd', token: token);

      verify(mockAnswerRemoteProvider.deleteAnswer(
          questionId: id, answerId: 'ddd', token: token));
      expect(result, responseModel);
    });

    test(
        'should return access denied when the user is not allowed to delete the question',
        () async {
      when(mockAnswerRemoteProvider.deleteAnswer(
              questionId: id, answerId: id, token: token))
          .thenAnswer((_) async => const Left(AnswerFailure.accessDenied()));

      final result = await answerRepositoryImpl.deleteAnswer(
          questionId: id, answerId: id, token: token);

      verify(mockAnswerRemoteProvider.deleteAnswer(
          questionId: id, answerId: id, token: token));

      expect(result, const Left(AnswerFailure.accessDenied()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockAnswerRemoteProvider.deleteAnswer(
              questionId: id, answerId: id, token: token))
          .thenAnswer((_) async => const Left(AnswerFailure.serverError()));
      final result = await answerRepositoryImpl.deleteAnswer(
          questionId: id, answerId: id, token: token);

      verify(mockAnswerRemoteProvider.deleteAnswer(
          questionId: id, answerId: id, token: token));
      expect(result, const Left(AnswerFailure.serverError()));
    });
    test('should return sdd for any other failure cases.',
        () async {
      when(mockAnswerRemoteProvider.deleteAnswer(
              questionId: id, answerId: id, token: token))
          .thenAnswer((_) async => const Left(AnswerFailure.serverError()));
      final result = await answerRepositoryImpl.deleteAnswer(
          questionId: id, answerId: id, token: token);

      verify(mockAnswerRemoteProvider.deleteAnswer(
          questionId: id, answerId: id, token: token));
      expect(result, const Left(AnswerFailure.serverError()));
    });
  });

  group('update an answer', () {
    test(
        'should return 200 for updating an answer if the user is the one who create the answer',
        () async {
      when(mockAnswerRemoteProvider.updateAnswer(token, answerModel))
          .thenAnswer((_) async => responseModel);

      final result =
          await answerRepositoryImpl.updateAnswer(token, answerModel);

      verify(mockAnswerRemoteProvider.updateAnswer(token, answerModel));
      expect(result, responseModel);
    });

    test(
        'should return access denied when the user is not allowed to update the answer',
        () async {
      when(mockAnswerRemoteProvider.updateAnswer(token, answerModel))
          .thenAnswer((_) async => const Left(AnswerFailure.accessDenied()));

      final result =
          await answerRepositoryImpl.updateAnswer(token, answerModel);

      verify(mockAnswerRemoteProvider.updateAnswer(token, answerModel));

      expect(result, const Left(AnswerFailure.accessDenied()));
    });

    test('should return a server failure for any other failure cases.',
        () async {
      when(mockAnswerRemoteProvider.updateAnswer(token, answerModel))
          .thenAnswer((_) async => const Left(AnswerFailure.serverError()));

      final result =
          await answerRepositoryImpl.updateAnswer(token, answerModel);

      verify(mockAnswerRemoteProvider.updateAnswer(token, answerModel));
      expect(result, const Left(AnswerFailure.serverError()));
    });
  });
}
