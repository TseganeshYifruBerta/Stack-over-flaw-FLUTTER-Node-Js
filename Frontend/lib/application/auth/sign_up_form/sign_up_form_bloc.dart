import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:please/domain/auth/user.dart';
import 'package:please/domain/auth/userModel.dart';
import 'package:please/infrastructure/auth/user_repository.dart';
import 'package:please/infrastructure/auth/shared_preference_repository.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

part 'sign_up_form_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserState.initial()) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RegisterWithEmailAndPasswordPressed>(_onRegister);
    on<SignInWithEmailAndPasswordPressed>(_onSignIn);
    on<UpdateProfilePressed>(_onUpdateProfilePressed);
  }

  void _onNameChanged(NameChanged event, Emitter<UserState> emit) {
    emit(state.copyWith(
      name: Name(event.name),
      authFailureOrSuccessOption: none(),
    ));
    print(state);
  }

  void _onEmailChanged(EmailChanged event, Emitter<UserState> emit) {
    emit(state.copyWith(
      emailAddress: EmailAddress(event.emailStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<UserState> emit) {
    emit(state.copyWith(
      password: Password(event.passwordStr),
      authFailureOrSuccessOption: none(),
    ));
  }

  void _onRegister(RegisterWithEmailAndPasswordPressed event,
      Emitter<UserState> emit) async {
    Either<AuthFailure, UserModel>? failureOrSuccess;
    final isNameValid = state.name.isValid();
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isNameValid && isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      User user = User(state.name.getOrCrash(), state.emailAddress.getOrCrash(),
          state.password.getOrCrash());
      failureOrSuccess = await userRepository.registerUser(user: user);
    }

    if (failureOrSuccess is Right) {
      emit(state.copyWith(
        isregisterSuccess: true,
      ));
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void _onSignIn(
      SignInWithEmailAndPasswordPressed event, Emitter<UserState> emit) async {
    Either<AuthFailure, UserModel>? failureOrSuccess;
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      User user = User(
          '', state.emailAddress.getOrCrash(), state.password.getOrCrash());
      failureOrSuccess = await userRepository.loginUser(user: user);
    }

    if (failureOrSuccess is Right) {
      failureOrSuccess?.fold((l) {}, (r) async {
        await SharedPreferenceRepository().setUserSharedPrefence(r);
      });
      emit(state.copyWith(
        isloginSuccess: true,
      ));
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void _onUpdateProfilePressed(
      UpdateProfilePressed event, Emitter<UserState> emit) async {
    Either<AuthFailure, UserModel>? failureOrSuccess;
    final isNameValid = state.name.isValid();
    final isEmailValid = state.emailAddress.isValid();
    final isPasswordValid = state.password.isValid();
    if (isNameValid && isEmailValid && isPasswordValid) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      User user = User(state.name.getOrCrash(), state.emailAddress.getOrCrash(),
          state.password.getOrCrash());
      final token = await SharedPreferenceRepository().getSavedUserToken();
      failureOrSuccess =
          await userRepository.editUser(user: user, token: token);
    }
    if (failureOrSuccess is Right) {
      failureOrSuccess?.fold((l) {}, (r) async {
        await SharedPreferenceRepository().setUserSharedPrefence(r);
      });

      emit(state.copyWith(
        isEditProfileSuccess: true,
      ));
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
