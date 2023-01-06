import 'package:flutter/material.dart';

class CircleBackground extends StatelessWidget {
  const CircleBackground({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.withOpacity(0.5),
      child: Center(
        child: child,
      ),
    );
  }
}
