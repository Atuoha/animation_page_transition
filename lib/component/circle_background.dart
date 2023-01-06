import 'package:flutter/material.dart';

class CircleBackground extends StatelessWidget {
  const CircleBackground({Key? key, required this.child, this.radius=20}) : super(key: key);
  final Widget child;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.grey.withOpacity(0.5),
      child: Center(
        child: child,
      ),
    );
  }
}
