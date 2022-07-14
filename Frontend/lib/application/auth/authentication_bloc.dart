import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:please/domain/auth/shared_prefrenece_model.dart';
import 'package:please/domain/auth/user.dart';
import 'package:please/infrastructure/auth/shared_preference_repository.dart';
import '../application.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SharedPreferenceRepository sharedPreferenceRepository;
  AuthenticationBloc(this.sharedPreferenceRepository) : super(UnAutheticated()) {
    print(state);
    on<SignInEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
  }

  void _onSignIn(SignInEvent event, Emitter<AuthenticationState> emit) async {
    UserModel user = await sharedPreferenceRepository.getSavedUser();
    emit(Authenticated(
        id: user.id,
        name: user.name,
        email: user.email,
        token: user.token,
        isAdmin: user.isAdmin));
  }

  void _onSignOut(SignOutEvent event, Emitter<AuthenticationState> emit) async {
    await sharedPreferenceRepository.deleteUserSharedPreference();
    emit(UnAutheticated());
  }
}
