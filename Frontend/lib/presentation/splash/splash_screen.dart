import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      context.go('/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashWidget(
        splashText: "Loading...",
      ),
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    Key? key,
    required this.splashText,
  }) : super(key: key);
  final String splashText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: const Color.fromARGB(255, 19, 21, 22),
      child: Stack(
        children: [
          Text(splashText),
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage("assets/images/stack.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  splashText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ],
      ),
    );
  }
}
