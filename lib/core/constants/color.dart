import 'package:flutter/material.dart';


class ColorTheme {
  static Color maincolor = Color(0xFFA57070);
  static Color primarycolor = Color(0xFFFFFFFFF);
  static Color secondarycolor = Color(0xFFE3E3E3);
  static Color bgcolor = Color(0xFFFFEAEA);


}

double constantsize(BuildContext context) {
  return MediaQuery.of(context).size.width *(1 / 411);

}