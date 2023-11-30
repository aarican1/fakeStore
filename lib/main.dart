
import 'package:fake_store/view/check_connection.dart';
import 'package:fake_store/view/empty_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fake Store',
        theme: fakeStoreThemeData(),
        builder: ((context, child) {
          return Column(
            children: [
             const CheckConnectionView(),
            Expanded(child: child ?? const Placeholder())
            ],
          );
        }),
        home:  EmptyPage());
  }

  ThemeData fakeStoreThemeData() {
    return ThemeData(
      buttonTheme: const ButtonThemeData(buttonColor: Colors.transparent),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0D0D0D),
          titleTextStyle: TextStyle(color: Color(0xffF9FAFB))),
      scaffoldBackgroundColor: const Color(0xff0D0D0D),
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff0D0D0D)),
      useMaterial3: true,
    );
  }
}
