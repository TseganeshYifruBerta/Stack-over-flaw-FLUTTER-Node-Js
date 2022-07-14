// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:please/application/question/question_event.dart';
// import 'package:please/application/question/question_state.dart';
// import 'package:please/domain/questions/question_model.dart';
// import 'package:please/infrastructure/question/question_repository.dart';
// import 'package:please/main.dart';
// import 'package:please/application/question/question_bloc.dart';
// import 'package:mockito/mockito.dart';

// import '../auth/authentication_bloc_test.dart';

// class MockQuestionRepository extends Mock implements QuestionRepository {}

// void main() {
//   MockQuestionRepository mockQuestionRepository;

//   setUp(() {
//     mockQuestionRepository = MockQuestionRepository();
//   });
//   // tearDown(() {
//   //   questionBloc?.dispose();
//   // });

//   group('QuestionBloc', () {
//     mockQuestionRepository = MockQuestionRepository();
//     final questions = Question(
//         id: '1',
//         authorId: '1',
//         authorName: 'abebe',
//         title: 'flutter',
//         answer: [],
//         description: 'what is widget',
//         dateTime: DateTime.utc(1989, 11, 9));
//     test('newer', () {
//       when(mockQuestionRepository.fetchAllQuestion())
//           .thenAnswer((_) async => questions);
//       final bloc = QuestionBloc(mockQuestionRepository);
//       // final bloc = QuestionBloc(mockQuestionRepository);
//       bloc.add((GetQuestionEvent('1')));
//       expectLater(
//           bloc, emitsInOrder([QuestionNotLoaded(),QuestionLoading(),QuestionNotLoaded(),NoQuestionLoaded()]));
//     });

// blocTest(
//     'emits [QuestionNotLoaded(),QuestionLoading(),QuestionNotLoaded(),NoQuestionLoaded()]) when successful',
//     build: () {
//       when(mockQuestionRepository.fetchAllQuestion())
//           .thenAnswer((_) async => questions);
//       return questions;
//     },
//     // act: (bloc) => bloc.add(Loaded())
//     List<Question> question = [questions, questions];
//     act: (bloc) => bloc.toString(),
//     expect: ()=>[
//     QuestionLoaded(question),
//     QuestionLoading(),
//     QuestionNotLoaded(),
//     NoQuestionLoaded()
//     ],
//   );
// blocTest(
//       'emits [QuestionNotLoaded(),QuestionLoading(),QuestionNotLoaded(),NoQuestionLoaded()]) when unsuccessful',
//       build: () {
//         when(mockQuestionRepository.fetchAllQuestion()).thenThrow(NetworkError());
//         return QuestionBloc(questions);
//       },
//       // act: (bloc) => bloc.add(SignInEvent()),
//       act: (bloc) => bloc.toString(),
//       expect:() => [
//          QuestionLoaded(questions),
//     QuestionLoading(),
//     QuestionNotLoaded(),
//     NoQuestionLoaded()
//       ],
//     );
//   });


// }

//         // questionBloc = QuestionBloc(questionRepository);
        
//       // late QuestionBloc questionBloc;
//       // 'QuestionBloc'