import 'package:flutter/material.dart';
import 'rick/ui/rick_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW Pagination',
      theme: ThemeData(useMaterial3: true),
      home: const RickScreen(),
    );
  }
}
