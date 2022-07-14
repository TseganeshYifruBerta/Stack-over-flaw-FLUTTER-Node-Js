part of 'sign_up_form_bloc.dart';

@freezed
abstract class UserState with _$UserState {
  const factory UserState({
    required Name name,
    required EmailAddress emailAddress,
    required Password password,
    required bool showErrorMessages,
    required bool isSubmitting,
    required bool isregisterSuccess,
    required bool isloginSuccess,
    required bool isEditProfileSuccess,
    required Option<Either<AuthFailure, UserModel>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory UserState.initial() => UserState(
        name: Name(''),
        emailAddress: EmailAddress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmitting: false,
        isregisterSuccess: false,
        isloginSuccess: false,
        isEditProfileSuccess: false,
        authFailureOrSuccessOption: none(),
      );
}


