import 'package:flutter/material.dart';
import 'package:pet_application/common/sizeconfig.dart';
import 'package:pet_application/screens/bottom_navigation_bar/home_screen.dart';
import 'package:pet_application/screens/bottom_navigation_bar/profile_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  int currentIndex;
   BottomNavigationScreen(this.currentIndex,{Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.currentIndex;
    setState(() {

    });
  }
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: IndexedStack(
        children: screens,
        index: currentIndex,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 15,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',),
            ],
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
