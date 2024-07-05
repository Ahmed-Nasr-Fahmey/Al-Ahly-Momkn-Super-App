import 'package:flutter/material.dart';

void main() async {

  runApp(
    const SuperApp(),
  );
}

class SuperApp extends StatelessWidget {
  const SuperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
      // initialRoute: CustomBottomNavigationBar.routeName,
      // onGenerateRoute: Routes.generateRoute,
    );
  }
}
