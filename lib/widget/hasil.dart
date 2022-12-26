import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class hasil extends StatelessWidget {
  final String judul;
  final Color warna;
  final double nilaiRadius;
  final double ukuranText;

  const hasil({
    Key? key,
    required this.judul,
    required this.nilaiRadius,
    required this.ukuranText,
    required this.warna,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: nilaiRadius,
          backgroundColor: warna,
        ),
        SizedBox(
          width: 21.w,
        ),
        Text(
          judul,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: ukuranText,
              color: Color(0xff6D6D6D),
            ),
          ),
        ),
      ],
    );
  }
}
