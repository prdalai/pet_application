import 'package:flutter/material.dart';
import 'package:pet_application/common/extensions.dart';
import 'package:pet_application/common/sharePreferencesReadWrite.dart';
import 'package:pet_application/common/style.dart';
import 'package:pet_application/screens/onboarding_screen/onboarding_screen.dart';
import 'package:pet_application/services/navigation_service.dart';
import 'package:pet_application/widgets/heading_subheading.dart';
import 'package:pet_application/widgets/text_button_widget.dart';

import 'bottom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigationService.navigateTo(BottomNavigationScreen(0), context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Profile', style: AppStyle().poppinsBoldPrimary20(),),
        ),
        body: Container(
          margin: EdgeInsets.all(AppStyle().defaultMargin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                headingSubheadingWidget('Name', SharedPreferencesReadWrite.readStringList('userInformation')[0].toString().capitalize()),
                headingSubheadingWidget('Pet Name', SharedPreferencesReadWrite.readStringList('userInformation')[1].toString().capitalize()),
                headingSubheadingWidget('Pet Breed', SharedPreferencesReadWrite.readStringList('userInformation')[2].toString().capitalize()),
                InkWell(
                    onTap: (){
                      SharedPreferencesReadWrite.writeStringList('userInformation', []);
                      NavigationService.navigateTo(OnBoardingPage(), context);
                    },
                    child: textButtonWidget('Log Out', Colors.blue, Colors.white)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
