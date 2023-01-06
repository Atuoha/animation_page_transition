import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../screens/about_screen.dart';

class FlBtn extends StatelessWidget {
  const FlBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: const CircleBorder(),
      // closedColor: Colors.white,
      transitionDuration: const Duration(seconds: 3),
      closedBuilder: (BuildContext context, void Function() action) =>
          Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor,
        ),
        height: 56,
        width: 56,
        child: const Icon(
          Icons.info,
          color: Colors.white,
        ),
      ),
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) =>
              const AboutScreen(),
    );
  }
}
