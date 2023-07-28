import 'package:flutter/material.dart';
import 'package:pet_application/screens/bottom_navigation_bar/find_a_vet_screen.dart';
import 'package:pet_application/screens/bottom_navigation_bar/other_pets.dart';
import 'package:pet_application/screens/bottom_navigation_bar/upload_image.dart';
import '../../common/colors.dart';
import '../../common/style.dart';
import '../../widgets/exit_confirmation_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  void _onContainer1Pressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FindAVet()));
    print('Container 1 pressed!');
  }

  void _onContainer2Pressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => CommunityImagesSection()));
    print('Container 2 pressed!');
  }

  void _onContainer3Pressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => YourImagesSection()));
    print('Container 3 pressed!');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          showExitConfirmationDialog(
              context,
              'Are you sure you want to exit from the app?',
              AppColors.primaryColor);
          return false;
        },
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: AppStyle().defaultMargin),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _onContainer1Pressed,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the container
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the image
                        child: Image(
                          image:
                              AssetImage('assets/home_screen/home_screen1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                      height: 20), // Optional spacing between text and divider
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent:
                        50, // Optional indent for the starting point of the divider
                    endIndent:
                        50, // Optional indent for the ending point of the divider
                  ),
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                      height: 20),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _onContainer1Pressed,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Set the shadow color
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Set the shadow offset
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the container
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the image
                        child: const Image(
                          image: AssetImage('assets/home_screen/find_a_vet.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _onContainer2Pressed,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Set the shadow color
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Set the shadow offset
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the container
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the image
                        child: Image(
                          image: AssetImage('assets/home_screen/pets_com.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: _onContainer3Pressed,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // Set the background color of the container
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.5), // Set the shadow color
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // Set the shadow offset
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the container
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20), // Set the radius for all four corners of the image
                        child: Image(
                          image: AssetImage('assets/home_screen/upload_images.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
