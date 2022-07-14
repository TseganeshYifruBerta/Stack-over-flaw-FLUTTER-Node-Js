import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/application.dart';
import '../presentation.dart';

AppBar AppBarComponent() {
  return AppBar(
      actions: [
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
          if (state is Authenticated) {
            return CircleImage(name: state.name);
          } else {
            return Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () {
                      context.go('/login');
                    }),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.amber),
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    onPressed: () {
                      context.go('/signup');
                    }),
                const SizedBox(
                  width: 8,
                ),
              ],
            );
          }
        }),
      ],
      backgroundColor: const Color.fromARGB(255, 47, 198, 209),
      title: const Text("AAiT Stack Overflow", style: TextStyle(fontSize: 20)));
}
