// ignore_for_file: deprecated_member_use

import 'package:coachmaker/coachmaker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:indikator_air/app/modules/Main_Menu/views/main_menu_view.dart';

class MainMenuController extends GetxController {
  // ignore: todo
  //TODO: Implement MainMenuController

  final count = 0.obs;
  static late BuildContext context;

  @override
  void onReady() {
    // print("Baru");
    playTutor();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void playTutor() {
    CoachMaker(
      context,
      skip: () {},

      ///coachmaker will show from index 0 to n of initialList
      ///
      initialList: [
        ///initial name of CoachPoint from previous example ☝️ (inital: '1')
        ///
        CoachModel(
          initial: '1',
          title: 'Gambar',
          maxWidth: 400,

          ///if subtitle length > 1 will show pageview slider
          ///
          subtitle: [
            'Klik gambar untuk memperbesar',
          ],
        ),

        ///other initials name available
        ///
        CoachModel(
          initial: '2',
          title: 'Input Angka',
          maxWidth: 400,
          alignment: Alignment.centerRight,
          subtitle: [
            'Input hasil pengamatanmu disini',
          ],
        ),
        CoachModel(
          initial: '3',
          title: 'Jumlah',
          maxWidth: 400,
          alignment: Alignment.centerRight,
          subtitle: [
            'Setelah memasukan hasil microba klik jumlah untuk mengetahui hasil kondisi air',
          ],
        ),
      ],
      nextStep: CoachMakerControl.next,
      buttonOptions: CoachButtonOptions(
        skipTitle: 'skip',
        buttonTitle: 'Lanjut',
        buttonStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          elevation: MaterialStateProperty.all(10),
        ),
      ),
    ).show();
  }
}
