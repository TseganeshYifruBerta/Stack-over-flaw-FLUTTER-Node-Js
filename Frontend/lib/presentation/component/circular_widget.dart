import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    this.name,
  }) : super(key: key);

  final String? name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: CircleAvatar(
          radius: 20 - 3,
          // backgroundImage: imageProvider,
          child: Text(name![0].toUpperCase()),
        ),
      ),
      onTap: () {
      },
    );
  }
}
