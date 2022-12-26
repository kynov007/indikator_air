// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Microba extends StatelessWidget {
  final String dialog;
  final String judul;
  final String img;
  final TextEditingController namaController;

  Microba({
    Key? key,
    required this.dialog,
    required this.judul,
    required this.namaController,
    required this.img,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 261.w,
      height: 75.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: dialog,
                content: Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(img))),
                ),
              );
            },
            child: Container(
              width: 75.w,
              height: 75.h,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(img)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          Text(
            judul,
            style: GoogleFonts.roboto(),
          ),
          Container(
            width: 42.w,
            height: 29.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: namaController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              keyboardAppearance: Brightness.dark,
            ),
          )
        ],
      ),
    );
  }
}
