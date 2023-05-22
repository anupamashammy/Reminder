
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reminder_application8078/colors/colors.dart';







class Themes{
  static final light= ThemeData(
       backgroundColor: Colors.white ,
        primaryColor: primaryClr,
        brightness: Brightness.light,
       // primarySwatch: Colors.blue,
      );

      static final dart= ThemeData(
        backgroundColor: darkGreyClr,
        primaryColor: darkGreyClr,
        brightness: Brightness.light
      );
}
TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
     // color: Get.isDarkMode?Colors.grey[400]:colors.black.grey
    )

  );

}

TextStyle get headingStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
     // color: Get.isDarkMode?Colors.white:colors.black
    )

  );

}

TextStyle get titleStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
     // color: Get.isDarkMode?Colors.white:colors.black
    )

  );

}

TextStyle get subtitleStyle{
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
     // color: Get.isDarkMode?Colors.white:colors.black
    )

  );

}