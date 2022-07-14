import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:please/application/answer/answer_bloc.dart';
import 'package:please/application/auth/authentication_bloc.dart';
import 'package:please/application/question/question_bloc.dart';
import 'package:please/infrastructure/answer/answer_remote_data_provider.dart';
import 'package:please/infrastructure/answer/answer_repository_impl.dart';
import 'package:please/infrastructure/auth/shared_preference_repository.dart';
import 'package:please/infrastructure/question/question_repository_impl.dart';
import 'package:please/infrastructure/question/question_remote_data_provider.dart';

import 'application/auth/sign_up_form/sign_up_form_bloc.dart';
import 'infrastructure/auth/user_remote__data_provider.dart';
import 'infrastructure/auth/user_repository_impl.dart';
import 'presentation/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(SharedPreferenceRepository()),
        ),
        BlocProvider<QuestionBloc>(
          create: (BuildContext context) => QuestionBloc(
              QuestionRepositoryImpl(QuestionRemoteDataProvider())),
        ),
        BlocProvider<AnswerBloc>(
          create: (BuildContext context) => AnswerBloc(
              answerRepository:
                  AnswerRepositoryImpl(AnswerRemoteDataProvider())),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        title: 'AAiT Stackover Flow',
      ),
    );
  }
}
