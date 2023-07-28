import 'package:flutter/material.dart';
import 'package:pet_application/common/colors.dart';
import 'package:pet_application/common/sharePreferencesReadWrite.dart';
import 'package:pet_application/common/style.dart';
import 'package:pet_application/screens/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:pet_application/services/navigation_service.dart';
import 'package:pet_application/widgets/alert_dialog.dart';
import 'package:pet_application/widgets/textfield_widget.dart';

class GetUserInformationScreen extends StatefulWidget {
  const GetUserInformationScreen({Key? key}) : super(key: key);

  @override
  State<GetUserInformationScreen> createState() =>
      _GetUserInformationScreenState();
}

class _GetUserInformationScreenState extends State<GetUserInformationScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController petBreedController = TextEditingController();

  Widget buildTextField(TextEditingController controller, String labelText) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: textFieldWidget(controller, labelText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Before we begin, let us get to know you better.',
                        textAlign: TextAlign.center,
                        style: AppStyle().poppinsBoldPrimary20(),
                      ),
                    ),
                  ),
                  buildTextField(userNameController, 'Enter your name'),
                  buildTextField(petNameController, "Enter your Pet's name"),
                  buildTextField(petBreedController, "Enter your Pet's breed"),
                  SizedBox(height: 0.1 * MediaQuery.of(context).size.width),
                  InkWell(
                    onTap: () {
                      if (validateFields()) {
                        saveUserInformation();
                        NavigationService.navigateTo(BottomNavigationScreen(0), context);
                      } else {
                        showAlertDialog(context, 'Error', 'Please fill all Details');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Let\'s Go!',
                        style: AppStyle().poppinsBoldGeneral(Colors.white, 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateFields() {
    return userNameController.text.isNotEmpty &&
        petNameController.text.isNotEmpty &&
        petBreedController.text.isNotEmpty;
  }

  void saveUserInformation() {
    final userInformation = [
      userNameController.text,
      petNameController.text,
      petBreedController.text,
    ];
    SharedPreferencesReadWrite.writeStringList('userInformation', userInformation);
  }
}
