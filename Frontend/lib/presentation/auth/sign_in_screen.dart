import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/application.dart';
import '../../infrastructure/infrastructure.dart';
import '../presentation.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<UserBloc>(
      create: (BuildContext context) => UserBloc(
          userRepository: UserRepositoryImpl(RemoteUserDataProvider())),
      child: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.isloginSuccess) {
            context.read<AuthenticationBloc>().add(SignInEvent());
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(
                    backgroundColor: Colors.black,
                    content: Text(
                      'User logged Succefully',
                      style: TextStyle(fontSize: 22, color: Colors.green),
                    )),
              );

            context.go('/');
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
                          style:
                              const TextStyle(fontSize: 22, color: Colors.red),
                        )),
                  );
              },
              (_) {},
            ),
          );
        },
        builder: (context, state) {
          return Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      constraints: BoxConstraints.expand(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                      ),
                      color: const Color.fromARGB(255, 56, 231, 243),
                      child: const Image(
                          image: AssetImage('assets/images/stack8.png'),
                          fit: BoxFit.contain),
                    ),
                    // End ... Image at head
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Login", style: ThemeFile.textTheme.headline1),
                            Text(
                              "Please fill the form below here",
                              style: ThemeFile.textTheme.headline3,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            EmailForm(),
                            PasswordWidget(),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 11, horizontal: 65),
                                    primary: const Color.fromARGB(
                                        255, 56, 231, 243), // background
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))
                                    // foreground
                                    ),
                                onPressed: () {
                                  context.read<UserBloc>().add(
                                      const SignInWithEmailAndPasswordPressed());
                                },
                                child: Text("Login",
                                    style: ThemeFile.textTheme.headline1),
                              ),
                            ),
                            Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Forget Password?",
                                      style: ThemeFile.textTheme.headline5,
                                    ))),
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 50, top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?",
                              style: ThemeFile.textTheme.headline3),
                          TextButton(
                              onPressed: () {
                                // Navigate to the second screen using a named route.
                                context.go('/signup');
                              },
                              child: Text(
                                "Sign Up",
                                style: ThemeFile.textTheme.headline5,
                              )),
                        ],
                      ),
                    ),
                    // end  ... do

                    if (state.isSubmitting) ...[
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(value: null),
                    ],
                  ],
                ),
              ],
            ),
          );
        },
      ),
    ));
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
