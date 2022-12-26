import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indikator_air/app/data/warna_air.dart';
import 'package:indikator_air/widget/keterangan.dart';

import '../../../../widget/hasil.dart';
import '../controllers/jumlah_controller.dart';

class JumlahView extends GetView<JumlahController> {
  const JumlahView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 28.w,
            vertical: 40.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Kondisi Air",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 32.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Text(
                      "Lokasi = ",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: JumlahController.lokasi,
                        autocorrect: false,
                        decoration: InputDecoration(
                            hintText: 'Isi Tempat',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.w,
                  ),
                  width: 305.w,
                  height: 143.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(4, 4), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffBFF4FF),
                        Color(0xffABC3FF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  child: Obx(
                    () => hasil(
                      judul: JumlahController.kualitasAir.value,
                      nilaiRadius: 40,
                      ukuranText: 24.sp,
                      warna: WarnaAir.warnaAirByQuality(
                          kualitasAir: JumlahController.kualitasAir.value),
                    ),
                  ),
                ),
                SizedBox(
                  height: 34.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 37.w,
                    vertical: 25.h,
                  ),
                  width: 305.w,
                  height: 345.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(4, 4), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffBFF4FF),
                        Color(0xffABC3FF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                    ),
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Keterangan",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 24.sp,
                            color: Color(0xff6D6D6D),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Keterangan(
                        text: "Sangat Kotor",
                        color: WarnaAir.SangatKotor,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Keterangan(
                        text: 'Kotor',
                        color: WarnaAir.Kotor,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Keterangan(
                        text: 'Sedang',
                        color: WarnaAir.Sedang,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Keterangan(
                        text: 'Bersih',
                        color: WarnaAir.Bersih,
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Keterangan(
                        text: 'Sangat Bersih',
                        color: WarnaAir.SangatBersih,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Container(
                  width: 305.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(3, 5), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (JumlahController.lokasi.text.isEmpty) {
                        Get.defaultDialog(
                            title: 'Error', middleText: 'Isi tempat dulu ya');
                      } else {
                        Get.offAndToNamed('laporan');
                        JumlahController.noUrut = 0;
                      }
                    },
                    child: Text(
                      "Cetak",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(fontSize: 32.sp)),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff4EABAB)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
