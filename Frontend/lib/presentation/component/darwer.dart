import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:please/domain/auth/userModel.dart';
import '../../application/application.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            //header of drawer
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 47, 198, 209),
            ),
            child: Center(
              child: Text(
                'AAit Stack Overflow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          ListTile(
              //menu item of Drawer
              leading: const Icon(Icons.home),
              title: const Text('Home Page'),
              onTap: () {
                context.go('/');
              }),
          ListTile(
              leading: const Icon(Icons.question_answer_rounded),
              title: const Text('Questions'),
              onTap: () {
                context.read<QuestionBloc>().add(LoadAllQuestionsEvent());

                context.go('/questions');
              }),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Column(
                  children: [
                    ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: const Text('Edit Profile'),
                        onTap: () {
                          User user = User(state.name, state.email, '');
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(SignInEvent());
                          context.go('/users/editProfile', extra: user);
                        }),
                    ListTile(
                        leading: const Icon(Icons.logout_outlined),
                        title: const Text('Log Out'),
                        onTap: () {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(SignOutEvent());
                          Navigator.pop(context);
                        })
                  ],
                );
              } else {
                return Column();
              }
            },
          ),
        ],
      ),
    );
  }
}
