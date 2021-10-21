import 'package:flutter/material.dart';

import 'models/theme.dart';
import 'screens/home.dart';

void main() {
  runApp(const Fooder());
}

class Fooder extends StatelessWidget {
  const Fooder({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooder',
      home: const Home(),
    );
  }
}
