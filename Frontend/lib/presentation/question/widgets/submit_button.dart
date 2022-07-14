import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:please/application/auth/authentication_bloc.dart';

import '../../../application/auth/authentication_state.dart';
import '../../presentation.dart';

Widget DisplayButton(double sizedH, double sizedW, Alignment align, String txt,
    FontWeight fWeight, double fSize) {
  return Align(
      alignment: align,
      child: SizedBox(
          height: sizedH,
          width: sizedW,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            ),
            onPressed: () {},
            child: Text(
              txt,
              style: TextStyle(fontSize: fSize, fontWeight: fWeight),
            ),
          )));
}

class CommonDecor extends StatelessWidget {
  const CommonDecor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 220,
        width: 290,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 180,
                height: 180,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(170)),

                  // border: Border.all(width: 3, color: Colors.green, style: BorderStyle.solid),
                ),
                // child: Align(
                //     alignment: Alignment.center, child: Text('asdasd')),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 140,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(150)),

                  // border: Border.all(width: 3, color: Colors.green, style: BorderStyle.solid),
                ),
                // child: Align(
                //     alignment: Alignment.center, child: Text('asdasd')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

AppBar AppBarWidgetsss() {
  return AppBar(
    actions: [
      BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        //    CircleImage(
        //   name: state.name.toString(),
        // );
        if (state is Authenticated) {
          return Text('data');
        } else {
          return Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5);
                        return null; // Use the component's default.
                      },
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onPressed: () {
                    context.go('/login');
                  }),
              TextButton(
                  style: ButtonStyle(),
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  onPressed: () {
                    context.go('/signup');
                  }),
            ],
          );
        }
      }),
    ],
    backgroundColor: const Color.fromARGB(255, 47, 198, 209),
    title: const Center(
        child: Text("AAiT Stack Overflow", style: TextStyle(fontSize: 20))),
  );
}
