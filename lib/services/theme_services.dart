import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reminder_application8078/colors/colors.dart';
import 'package:sizer/sizer.dart';

class ThemeService{
  final _box = GetStorage();
  final _key = 'isDarkMode';
  _saveThemeToBox(bool isDarkMode)=>_box.write(_key, isDarkMode);



  bool  _loadThemeFeomBox()=>_box.read(_key)??false;
ThemeMode get theme => _loadThemeFeomBox()?ThemeMode.dark:ThemeMode.light;
// ignore: non_constant_identifier_names
void SwitchTheme(){
  Get.changeThemeMode(_loadThemeFeomBox()?ThemeMode.light:ThemeMode.dark);
  
  _saveThemeToBox(!_loadThemeFeomBox());
}



}





textStyle(){
  fontsize : 28.sp;
  Color : pinkClr;
  FontWeight : FontWeight.w500;

           
 }