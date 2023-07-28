import 'package:flutter/material.dart';
import 'package:pet_application/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:pet_application/screens/onboarding_screen/onboarding_screen.dart';

import 'common/sharePreferencesReadWrite.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesReadWrite.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets App',
      debugShowCheckedModeBanner: false,
      home: SharedPreferencesReadWrite.readStringList('userInformation').isEmpty ?const OnBoardingPage() :  BottomNavigationScreen(0),
    );
  }
}
