import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  testWidgets('authentication bloc ...', (tester) async {
    // TODO: Implement test
  });
}



// class MockAuthRepository extends Mock implements SharedPreferenceRepository {}

// void main() {
  
//   MockAuthRepository mockAuthRepository;
//   setUp() {
//     mockAuthRepository = MockAuthRepository();
//   }

//   group('auth', () {
//     final auth = Authenticated(
//       id: '1',
//       name: 'Abebe',
//       email: 'abe@gmail.com',
//       isAdmin: false,
//       token: 'abe');
//       final sharedPreference = SharedPreference(
//         id: '1',
//         name: 'Abebe',
//         email: 'abe@gmail.com',
//         isAdmin: false,
//         token: 'abe');
//         final bloc = AuthenticationBloc();
//          mockAuthRepository = MockAuthRepository();
//       test('', () async {
   
    
//     when(mockAuthRepository.setUserSharedPrefence(sharedPreference))
//         .thenAnswer((_) async => auth);
    
//     bloc.add(SignInEvent());
//     expectLater(
//         bloc,
//         emitsInOrder([
//           Authenticated(
//               id: '1',
//               name: 'Abebe',
//               email: 'abe@gmail.com',
//               isAdmin: false,
//               token: 'abe'),
//           UnAutheticated()
//         ]));
//   });

  
// blocTest(
//     'emits [Authenticated(), UnAuthenticated] when successful',
//     build: () {
//       when(mockAuthRepository.setUserSharedPrefence(sharedPreference))
//           .thenAnswer((_) async => auth);
//       return AuthenticationBloc();
//     },
//     // act: (bloc) => bloc.add(SignInEvent())
//     act: (bloc) => bloc.toString(),
//     expect: ()=>[Authenticated(
//               id: '1',
//               name: 'Abebe',
//               email: 'abe@gmail.com',
//               isAdmin: false,
//               token: 'abe'),
//           UnAutheticated()
//         ],
//   );
// blocTest(
//       'emits [WeatherLoading, WeatherError] when unsuccessful',
//       build: () {
//         when(mockAuthRepository.setUserSharedPrefence(sharedPreference)).thenThrow(NetworkError());
//         return AuthenticationBloc();
//       },
//       // act: (bloc) => bloc.add(SignInEvent()),
//       act: (bloc) => bloc.toString(),
//       expect:() => [
//         Authenticated(
//               id: '1',
//               name: 'Abebe',
//               email: 'abe@gmail.com',
//               isAdmin: false,
//               token: 'abe'),
//           UnAutheticated()
//       ],
//     );
//   });

//   }
  
//   class NetworkError {
//   }