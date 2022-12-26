// ignore_for_file: duplicate_import

import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indikator_air/app/data/kualitas_air.dart';
import 'package:indikator_air/app/modules/Jumlah/controllers/jumlah_controller.dart';
// ignore: unused_import
import 'package:lottie/lottie.dart';
// ignore: unused_import
import 'package:coachmaker/coachmaker.dart';

import '../../../../widget/microba.dart';
import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  MainMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MainMenuController.context = context;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 801.h,
            padding: EdgeInsets.symmetric(
              horizontal: 26.w,
              vertical: 40.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Analisis Bentos",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 32.sp,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromARGB(255, 75, 130, 175),
                      ),
                      height: 40.h,
                      width: 40.w,
                      child: Tooltip(
                        message: 'Info Pengembang',
                        child: IconButton(
                          style: IconButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Get.defaultDialog(
                                title: 'Informasi Pengembang',
                                content: Column(
                                  children: [
                                    Text(
                                        "1. Prof. Dr. Susriyati Mahanal, M.Pd.\nsusriyati.mahanal.fmipa@um.ac.id\n\n2. Prof. Dr. Siti Zubaidah, M.Pd. \nsiti.zubaidah.fmipa@um.ac.id\n\n3. Deny Setiawan, M.Pd.\nsetiawan.fmipa@um.ac.id\n\nDosen Jurusan Biologi FMIPA Universitas Negeri Malang"),
                                  ],
                                ));
                          },
                          icon: Icon(
                            color: Colors.white,
                            Icons.info_outline,
                            size: 24.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Sensitive',
                    ),
                    Tab(
                      text: 'Moderate',
                    ),
                    Tab(
                      text: 'Toleran',
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        width: 308.w,
                        height: 531.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffBFF4FF),
                              Color(0xffABC3FF),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Sensitive",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: 32.sp,
                                      color: Color(0xff6D6D6D),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 52.h,
                                ),
                                Container(
                                  width: 261.w,
                                  height: 75.h,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.defaultDialog(
                                            title: 'Mayflies Nymph',
                                            content: Container(
                                              height: 200.h,
                                              width: 200.w,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/sensitive/sensitiv-1-01.png'))),
                                            ),
                                          );
                                        },
                                        child: CoachPoint(
                                          initial: '1',
                                          child: Container(
                                            width: 75.w,
                                            height: 75.h,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/sensitive/sensitiv-1-01.png')),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Mayflies Nymph',
                                        style: GoogleFonts.roboto(),
                                      ),
                                      Container(
                                        width: 42.w,
                                        height: 29.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: CoachPoint(
                                          initial: '2',
                                          child: TextFormField(
                                            controller:
                                                JumlahController.sensitif1,
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            keyboardAppearance: Brightness.dark,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Caddisfly Larva',
                                  dialog: 'Caddisfly Larva',
                                  img: 'assets/sensitive/sensitiv-1-02.png',
                                  namaController: JumlahController.sensitif2,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Water Penny Beetle\nLarva',
                                  dialog: 'Water Penny Beetle Larva',
                                  img: 'assets/sensitive/sensitiv-1-03.png',
                                  namaController: JumlahController.sensitif3,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Dobsonfly Pupa',
                                  dialog: 'Dobsonfly Pupa',
                                  img: 'assets/sensitive/sensitiv-1-04.png',
                                  namaController: JumlahController.sensitif4,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Stoneflies ',
                                  dialog: 'Stoneflies',
                                  img: 'assets/sensitive/sensitiv-1-05.png',
                                  namaController: JumlahController.sensitif5,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Most Caddisflies',
                                  dialog: 'Most Caddisflies',
                                  img: 'assets/sensitive/sensitiv-1-06.png',
                                  namaController: JumlahController.sensitif6,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        width: 308.w,
                        height: 531.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffBFF4FF),
                              Color(0xffABC3FF),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Moderate",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: 32.sp,
                                      color: Color(0xff6D6D6D),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 52.h,
                                ),
                                Microba(
                                  judul: 'Damsefly',
                                  dialog: 'Damsefly',
                                  img: 'assets/moderate/Moderat.png',
                                  namaController: JumlahController.moderat1,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Clams',
                                  dialog: 'Clams',
                                  img: 'assets/toleran/toleran-1-19.png',
                                  namaController: JumlahController.toleran5,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Crayfish',
                                  dialog: 'Crayfish',
                                  img: 'assets/moderate/Moderat-1-08.png',
                                  namaController: JumlahController.moderat2,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Sowbug',
                                  dialog: 'Sowbug',
                                  img: 'assets/moderate/Moderat-1-09.png',
                                  namaController: JumlahController.moderat3,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Water Beetle',
                                  dialog: 'Water Beetle',
                                  img: 'assets/moderate/Moderat-1-11.png',
                                  namaController: JumlahController.moderat4,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Dragonfly Nymph',
                                  dialog: 'Dragonfly Nymph',
                                  img: 'assets/moderate/Moderat-1-10.png',
                                  namaController: JumlahController.moderat5,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Riffle Beetle Adult',
                                  dialog: 'Riffle Beetle Adult',
                                  img: 'assets/moderate/Moderat-1-12.png',
                                  namaController: JumlahController.moderat6,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Flatworm',
                                  dialog: 'Flatworm',
                                  img: 'assets/moderate/Moderat-1-14.png',
                                  namaController: JumlahController.moderat7,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Cranefly Larva',
                                  dialog: 'Cranefly Larva',
                                  img: 'assets/moderate/Moderat-1-13.png',
                                  namaController: JumlahController.moderat8,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.h),
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        width: 308.w,
                        height: 531.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffBFF4FF),
                              Color(0xffABC3FF),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.0, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: ListView(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Toleran",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontSize: 32.sp,
                                      color: Color(0xff6D6D6D),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 52.h,
                                ),
                                Microba(
                                  judul: 'Water Snails',
                                  dialog: 'Water Snails',
                                  img: 'assets/toleran/toleran-1-15.png',
                                  namaController: JumlahController.toleran1,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Simulidae',
                                  dialog: 'Simulidae',
                                  img: 'assets/toleran/toleran-1-16.png',
                                  namaController: JumlahController.toleran2,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Midge Larva',
                                  dialog: 'Midge Larva',
                                  img: 'assets/toleran/toleran-1-17.png',
                                  namaController: JumlahController.toleran3,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Aquatic Worm',
                                  dialog: 'Aquatic Worm',
                                  img: 'assets/toleran/toleran-1-18.png',
                                  namaController: JumlahController.toleran4,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Red Tailed Maggot',
                                  dialog: 'Red Tailed Maggot',
                                  img: 'assets/toleran/toleran-1-20.png',
                                  namaController: JumlahController.toleran6,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Leeches',
                                  dialog: 'Leeches',
                                  img: 'assets/toleran/toleran-1-21.png',
                                  namaController: JumlahController.toleran7,
                                ),
                                SizedBox(
                                  height: 28.h,
                                ),
                                Microba(
                                  judul: 'Scuds',
                                  dialog: 'Scuds',
                                  img: 'assets/toleran/toleran-1-22.png',
                                  namaController: JumlahController.toleran8,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 40.h),
                      //   padding: EdgeInsets.symmetric(horizontal: 22.w),
                      //   width: 308.w,
                      //   height: 531.h,
                      //   decoration: BoxDecoration(
                      //     gradient: LinearGradient(
                      //       colors: [
                      //         Color(0xffBFF4FF),
                      //         Color(0xffABC3FF),
                      //       ],
                      //       begin: Alignment.topCenter,
                      //       end: Alignment.bottomCenter,
                      //       stops: [0.0, 1.0],
                      //     ),
                      //     borderRadius: BorderRadius.circular(40),
                      //   ),
                      //   child: ListView(
                      //     children: [
                      //       Column(
                      //         children: [
                      //           Text(
                      //             "Sensitive",
                      //             style: GoogleFonts.roboto(
                      //               textStyle: TextStyle(
                      //                 fontSize: 32.sp,
                      //                 color: Color(0xff6D6D6D),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 52.h,
                      //           ),
                      //           Container(
                      //             width: 261.w,
                      //             height: 75.h,
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 GestureDetector(
                      //                   onTap: () {
                      //                     Get.defaultDialog(
                      //                       title: 'Mayflies Nymph',
                      //                       content: Container(
                      //                         height: 200.h,
                      //                         width: 200.w,
                      //                         decoration: BoxDecoration(
                      //                             image: DecorationImage(
                      //                                 image: AssetImage(
                      //                                     'assets/sensitive/sensitiv-1-01.png'))),
                      //                       ),
                      //                     );
                      //                   },
                      //                   child: CoachPoint(
                      //                     initial: '1',
                      //                     child: Container(
                      //                       width: 75.w,
                      //                       height: 75.h,
                      //                       decoration: BoxDecoration(
                      //                         image: DecorationImage(
                      //                             image: AssetImage(
                      //                                 'assets/sensitive/sensitiv-1-01.png')),
                      //                         color: Colors.white,
                      //                         borderRadius: BorderRadius.circular(25),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   'Mayflies Nymph',
                      //                   style: GoogleFonts.roboto(),
                      //                 ),
                      //                 Container(
                      //                   width: 42.w,
                      //                   height: 29.h,
                      //                   decoration: BoxDecoration(
                      //                     color: Colors.white,
                      //                     borderRadius: BorderRadius.circular(10),
                      //                   ),
                      //                   child: CoachPoint(
                      //                     initial: '2',
                      //                     child: TextFormField(
                      //                       controller: JumlahController.sensitif1,
                      //                       textAlign: TextAlign.center,
                      //                       keyboardType: TextInputType.number,
                      //                       keyboardAppearance: Brightness.dark,
                      //                     ),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           // Microba(
                      //           //   judul: 'Mayflies Nymph',
                      //           //   dialog: 'Mayflies Nymph',
                      //           //   img: 'assets/sensitive/sensitiv-1-01.png',
                      //           //   namaController: JumlahController.sensitif1,
                      //           // ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Caddisfly Larva',
                      //             dialog: 'Caddisfly Larva',
                      //             img: 'assets/sensitive/sensitiv-1-02.png',
                      //             namaController: JumlahController.sensitif2,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Water Penny Beetle\nLarva',
                      //             dialog: 'Water Penny Beetle Larva',
                      //             img: 'assets/sensitive/sensitiv-1-03.png',
                      //             namaController: JumlahController.sensitif3,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Dobsonfly Pupa',
                      //             dialog: 'Dobsonfly Pupa',
                      //             img: 'assets/sensitive/sensitiv-1-04.png',
                      //             namaController: JumlahController.sensitif4,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Stoneflies ',
                      //             dialog: 'Stoneflies',
                      //             img: 'assets/sensitive/sensitiv-1-05.png',
                      //             namaController: JumlahController.sensitif5,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Most Caddisflies',
                      //             dialog: 'Most Caddisflies',
                      //             img: 'assets/sensitive/sensitiv-1-06.png',
                      //             namaController: JumlahController.sensitif6,
                      //           ),
                      //           SizedBox(
                      //             height: 35.h,
                      //           ),
                      //           Text(
                      //             "Moderate",
                      //             style: GoogleFonts.roboto(
                      //               textStyle: TextStyle(
                      //                 fontSize: 32.sp,
                      //                 color: Color(0xff6D6D6D),
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 52.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Damsefly',
                      //             dialog: 'Damsefly',
                      //             img: 'assets/moderate/Moderat.png',
                      //             namaController: JumlahController.moderat1,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Crayfish',
                      //             dialog: 'Crayfish',
                      //             img: 'assets/moderate/Moderat-1-08.png',
                      //             namaController: JumlahController.moderat2,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Sowbug',
                      //             dialog: 'Sowbug',
                      //             img: 'assets/moderate/Moderat-1-09.png',
                      //             namaController: JumlahController.moderat3,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Water Beetle',
                      //             dialog: 'Water Beetle',
                      //             img: 'assets/moderate/Moderat-1-11.png',
                      //             namaController: JumlahController.moderat4,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Dragonfly Nymph',
                      //             dialog: 'Dragonfly Nymph',
                      //             img: 'assets/moderate/Moderat-1-10.png',
                      //             namaController: JumlahController.moderat5,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Riffle Beetle Adult',
                      //             dialog: 'Riffle Beetle Adult',
                      //             img: 'assets/moderate/Moderat-1-12.png',
                      //             namaController: JumlahController.moderat6,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Flatworm',
                      //             dialog: 'Flatworm',
                      //             img: 'assets/moderate/Moderat-1-14.png',
                      //             namaController: JumlahController.moderat7,
                      //           ),
                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //           Microba(
                      //             judul: 'Cranefly Larva',
                      //             dialog: 'Cranefly Larva',
                      //             img: 'assets/moderate/Moderat-1-13.png',
                      //             namaController: JumlahController.moderat8,
                      //           ),
                      //           SizedBox(
                      //             height: 35.h,
                      //           ),

                      //           SizedBox(
                      //             height: 28.h,
                      //           ),
                      //         ],
                      //       )
                      //     ],

                      // return CoachPoint(
                      //   initial: index.toString(),
                      //   child: ListTile(
                      //     title: Text("${index}"),
                      //   ),
                      //   //   child:
                      //   // );
                      // ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 43.h,
                ),
                Container(
                  width: 305.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: CoachPoint(
                    initial: '3',
                    child: ElevatedButton(
                      onPressed: () {
                        JumlahController.organismeSensitiv.clear();
                        JumlahController.organismeModerat.clear();
                        JumlahController.organismeToleran.clear();
                        int jumlahSensitiv =
                            JumlahController.cekJumlahSensitive();

                        int jumlahModerat = JumlahController.cekJumlahModerat();
                        int jumlahToleran = JumlahController.cekJumlahToleran();

                        // Get.offAndToNamed('jumlah');
                        JumlahController.kualitasAir.value = KualitasAir()
                            .cekKualitasAir(
                                sensitif: jumlahSensitiv,
                                moderat: jumlahModerat,
                                toleran: jumlahToleran);
                        Get.toNamed('jumlah');
                      },
                      child: Text(
                        "Jumlah",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(fontSize: 25.sp)),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
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
