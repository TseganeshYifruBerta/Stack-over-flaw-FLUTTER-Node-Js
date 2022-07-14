part of 'sign_up_form_bloc.dart';

@freezed
abstract class UserEvent with _$UserEvent {
  const factory UserEvent.nameChanged(String name) = NameChanged;

  const factory UserEvent.emailChanged(String emailStr) = EmailChanged;
  const factory UserEvent.passwordChanged(String passwordStr) = PasswordChanged;
  const factory UserEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
  const factory UserEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;

  const factory UserEvent.updateProfilePressed() = UpdateProfilePressed;
}
