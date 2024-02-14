import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextPoppines extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final bool? textdecoration;
  const MyTextPoppines(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.maxLines,
      this.textAlign,
      this.textdecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize ?? width / 28,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontStyle: FontStyle.normal,
        color: color ?? Colors.white,
        decoration: textdecoration ?? false ? TextDecoration.lineThrough : null,
        decorationThickness: 2,
        decorationColor: color ?? Colors.white,
      ),
      textAlign: textAlign,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
