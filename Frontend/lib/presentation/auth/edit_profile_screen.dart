import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:please/domain/auth/userModel.dart';

import '../../application/application.dart';
import '../../infrastructure/infrastructure.dart';
import '../presentation.dart';

class EditProfileScreen extends StatelessWidget {
  final User user;

  const EditProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      gapPadding: 8,
      borderSide:
          const BorderSide(width: 1.2, color: Color.fromARGB(255, 9, 144, 153)),
      borderRadius: BorderRadius.circular(40),
    );
    var outlineErrorBorder = OutlineInputBorder(
      gapPadding: 8,
      borderSide: const BorderSide(width: 1.2, color: Colors.red),
      borderRadius: BorderRadius.circular(40),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 198, 209),
      ),
      body: BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(
              userRepository: UserRepositoryImpl(RemoteUserDataProvider())),
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state.isEditProfileSuccess) {
                context.read<AuthenticationBloc>().add(SignInEvent());
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.black,
                        content: Text(
                          'Update profile Successfully',
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30, right: 30, top: 30, bottom: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "Update Account",
                        style: ThemeFile.textTheme.headline1,
                      ),
                    ),
                    // Container(
                    //   margin:
                    //       const EdgeInsets.only(left: 30, right: 30, bottom: 40),
                    //   alignment: Alignment.center,
                    //   child: Text(
                    //     "Please fill the form below here",
                    //     style: ThemeFile.textTheme.headline3,
                    //   ),
                    // ),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 30, right: 30, bottom: 10),
                        child: Column(children: [
                          Container(
                            height: 90,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5),
                            child: TextFormField(
                              initialValue: user.name,
                              keyboardType: TextInputType.text,
                              showCursor: true,
                              style: ThemeFile.textTheme.headline2,
                              decoration: InputDecoration(
                                errorStyle: TextStyle(fontSize: 16),
                                border: outlineInputBorder,
                                focusedErrorBorder: outlineErrorBorder,
                                errorBorder: outlineErrorBorder,
                                focusedBorder: outlineInputBorder,
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 15, right: 5),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                hintText: "Enter name",
                                hintStyle: ThemeFile.textTheme.headline4,
                                labelText: "Name",
                                labelStyle: ThemeFile.textTheme.headline3,
                              ),
                              autocorrect: false,
                              onChanged: (value) => context
                                  .read<UserBloc>()
                                  .add(NameChanged(value)),
                              validator: (_) => context
                                  .read<UserBloc>()
                                  .state
                                  .name
                                  .value
                                  .fold(
                                    (f) => f.maybeMap(
                                      shortName: (_) => 'Invalid Name',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            height: 90,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 5),
                            child: TextFormField(
                              initialValue: user.email,
                              keyboardType: TextInputType.emailAddress,
                              showCursor: true,
                              style: ThemeFile.textTheme.headline2,
                              decoration: InputDecoration(
                                errorStyle: const TextStyle(fontSize: 16),
                                border: outlineInputBorder,
                                focusedErrorBorder: outlineErrorBorder,
                                errorBorder: outlineErrorBorder,
                                focusedBorder: outlineInputBorder,
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.only(left: 15, right: 5),
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                hintText: "Enter email",
                                hintStyle: ThemeFile.textTheme.headline4,
                                labelText: "Email",
                                labelStyle: ThemeFile.textTheme.headline3,
                              ),
                              autocorrect: false,
                              onChanged: (value) => context
                                  .read<UserBloc>()
                                  .add(EmailChanged(value)),
                              validator: (_) => context
                                  .read<UserBloc>()
                                  .state
                                  .emailAddress
                                  .value
                                  .fold(
                                    (f) => f.maybeMap(
                                      invalidEmail: (_) => 'Invalid Email',
                                      orElse: () => null,
                                    ),
                                    (_) => null,
                                  ),
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          const PasswordWidget(),
                          SigninButton(context),
                        ])),
                    if (state.isSubmitting) ...[
                      const SizedBox(height: 8),
                      const LinearProgressIndicator(value: null),
                    ],
                  ],
                ),
              );
            },
          )),
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
          context.read<UserBloc>().add(const UpdateProfilePressed());
        },
        child: const Text(
          'Update',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
