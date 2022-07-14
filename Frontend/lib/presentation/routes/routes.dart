import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:please/application/question/question_bloc.dart';
import 'package:please/domain/answer/answer_model.dart';
import 'package:please/domain/auth/userModel.dart';
import 'package:please/domain/questions/question_model.dart';

import '../../application/auth/authentication_bloc.dart';
import '../../application/auth/authentication_state.dart';
import '../../application/question/question_event.dart';
import '../answer/add_answer_screen.dart';
import '../answer/edit_answer_screen.dart';
import '../presentation.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LogInScreen(),
    ),
    GoRoute(
        path: '/questions',
        // pageBuilder: (context, state) => LogInScreen(),

        builder: (context, state) {
          context.read<QuestionBloc>().add(LoadAllQuestionsEvent());
          return QuestionScreen();
        }),
    GoRoute(
      path: '/questions/add',
      builder: (context, state) =>
          (context.read<AuthenticationBloc>().state is Authenticated)
              ? AddQuestionScreen()
              : LogInScreen(),
    ),
    GoRoute(
        path: '/questions/:id',
        builder: (context, state) =>
            QuestionDetailScreen(state.extra as Question)),
    GoRoute(
        path: '/questions/edit/:id',
        builder: (context, state) =>
            EditQuestionScreen(state.extra as Question)),
    GoRoute(
        path: '/users/editProfile',
        builder: (context, state) =>
            EditProfileScreen(user: state.extra as User)),
    GoRoute(
        path: '/answers/add/:questionId',
        builder: (context, state) =>
            AddAnswerScreen(questionId: state.extra as String)),
    GoRoute(
        path: '/answers/edit/:id',
        builder: (context, state) =>
            EditAnswerScreen(answer: state.extra as Answer)),
  ],
);
