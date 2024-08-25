import 'package:flutter/material.dart';
import 'package:flutter_practice/app/modules/counter/presentation/pages/counter_pages.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterPage());
  }
}
