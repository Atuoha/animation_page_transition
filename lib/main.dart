import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/screens/details.dart';

import 'package:page_transition/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'data/list_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.deepPurple.withOpacity(0.7),
      ),
    );
    return ChangeNotifierProvider(
        create: (context) => ItemData(),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const HomeScreen(),
          routes: {
            DetailsScreen.routeName: (context) => const DetailsScreen(),
          },
        ));
  }
}
