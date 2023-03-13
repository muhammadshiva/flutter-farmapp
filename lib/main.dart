import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rphu_application/shared/theme.dart';
import 'package:rphu_application/ui/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: lightBgColor,
        appBarTheme: AppBarTheme(
          backgroundColor: lightBgColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle:
              blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) =>  HomePageScreen(),
      },
    );
  }
}
