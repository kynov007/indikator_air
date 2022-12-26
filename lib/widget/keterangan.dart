import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Keterangan extends StatelessWidget {
  final String text;
  final Color color;

  const Keterangan({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
        ),
        SizedBox(
          width: 9.w,
        ),
        Text(
          text,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 16.sp,
              color: Color(0xff6D6D6D),
            ),
          ),
        ),
      ],
    );
  }
}
