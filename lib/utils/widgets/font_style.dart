
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import 'colors_customs.dart';
 fontOldStandardTt ({ Color? color,double? fontSize,FontStyle? fontStyle,FontWeight? fontWeight}){return GoogleFonts.oldStandardTt(
color: color ?? CustomColors.textBlack,
fontSize: fontSize,fontWeight: fontWeight??FontWeight.w100,
fontStyle: fontStyle ?? FontStyle.normal,
decoration: TextDecoration.none);}