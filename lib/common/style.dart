import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_application/common/colors.dart';

class AppStyle {
  double defaultMargin = 15;
  TextStyle poppinsBoldPrimary20() {
    return GoogleFonts.poppins(
      color: AppColors.primaryColor,
      fontSize: 20,
      fontWeight: FontWeight.w500
    );
  }

  TextStyle poppinsBoldGeneral(Color color, double size) {
    return GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w500
    );
  }

  TextStyle poppinsBoldOrange20() {
    return GoogleFonts.poppins(
        color: AppColors.orangeColor,
        fontSize: 20,
        fontWeight: FontWeight.w500
    );


  }

  TextStyle poppinsBoldBlack20() {
    return GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500
    );
  }

  TextStyle poppinsSemiBoldBlack18() {
    return GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400
    );
  }
}
