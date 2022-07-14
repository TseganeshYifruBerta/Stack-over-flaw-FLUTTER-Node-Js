import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/application.dart';
import '../../infrastructure/infrastructure.dart';
import '../presentation.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 198, 209),
      ),
      body: BlocProvider<UserBloc>(
        create: (BuildContext context) => UserBloc(
            userRepository: UserRepositoryImpl(RemoteUserDataProvider())),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state.isregisterSuccess) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.black,
                      content: Text(
                        'User registered Succefully',
                        style: TextStyle(fontSize: 22, color: Colors.green),
                      )),
                );
              context.go('/login');
            }

            state.authFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  String message;
                  message = failure.map(
                    cancelledByUser: (_) => 'Cancelled',
                    serverError: (_) => 'Server error',
                    emailAlreadyInUse: (_) => 'Email already in use',
                    invalidEmailAndPasswordCombination: (_) =>
                        'Invalid email and password combination',
                  );

                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.black,
                          content: Text(
                            message,
                            style: const TextStyle(
                                fontSize: 22, color: Colors.red),
                          )),
                    );
                },
                (_) {},
              ),
            );
          },
          builder: (context, state) {
            return Form(
              // onChanged:
              autovalidateMode: AutovalidateMode.onUserInteraction,
              // autovalidate: state.showErrorMessages,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 5),
                    alignment: Alignment.center,
                    child: Text(
                      "Create Account",
                      style: ThemeFile.textTheme.headline1,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                    alignment: Alignment.center,
                    child: Text(
                      "Please fill the form below here",
                      style: ThemeFile.textTheme.headline3,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 10),
                      child: Column(children: [
                        const NameForm(),
                        const EmailForm(),
                        const PasswordWidget(),
                        SigninButton(context),
                        Container(
                          margin: const EdgeInsets.only(bottom: 50, top: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account ?",
                                  style: ThemeFile.textTheme.headline3),
                              TextButton(
                                  onPressed: () {
                                    context.go('/login');
                                  },
                                  child: Text(
                                    "Signin",
                                    style: ThemeFile.textTheme.headline5,
                                  )),
                            ],
                          ),
                        ),
                      ])),
                  if (state.isSubmitting) ...[
                    const SizedBox(height: 8),
                    const LinearProgressIndicator(value: null),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container SigninButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            primary: const Color.fromARGB(255, 56, 231, 243),
            // background
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
            // foreground
            ),
        onPressed: () {
          context
              .read<UserBloc>()
              .add(const RegisterWithEmailAndPasswordPressed());
        },
        child: const Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
