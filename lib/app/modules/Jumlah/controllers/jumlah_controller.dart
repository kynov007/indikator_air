import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JumlahController extends GetxController {
  // ignore: todo
  //TODO: Implement JumlahController

  static var kualitasAir = ''.obs;
  static int noUrut = 0;
  static Map<String, dynamic> organismeSensitiv = {};
  static Map<String, dynamic> organismeModerat = {};
  static Map<String, dynamic> organismeToleran = {};

  static final TextEditingController lokasi =
      TextEditingController(); //Sensitiv
  static final TextEditingController sensitif1 = TextEditingController();
  static final TextEditingController sensitif2 = TextEditingController();
  static final TextEditingController sensitif3 = TextEditingController();
  static final TextEditingController sensitif4 = TextEditingController();
  static final TextEditingController sensitif5 = TextEditingController();
  static final TextEditingController sensitif6 = TextEditingController();

//MOderat
  static final TextEditingController moderat1 = TextEditingController();
  static final TextEditingController moderat2 = TextEditingController();
  static final TextEditingController moderat3 = TextEditingController();
  static final TextEditingController moderat4 = TextEditingController();
  static final TextEditingController moderat5 = TextEditingController();
  static final TextEditingController moderat6 = TextEditingController();
  static final TextEditingController moderat7 = TextEditingController();
  static final TextEditingController moderat8 = TextEditingController();
  static final TextEditingController moderat9 = TextEditingController();

//TOleran
  static final TextEditingController toleran1 = TextEditingController();
  static final TextEditingController toleran2 = TextEditingController();
  static final TextEditingController toleran3 = TextEditingController();
  static final TextEditingController toleran4 = TextEditingController();
  static final TextEditingController toleran5 = TextEditingController();
  static final TextEditingController toleran6 = TextEditingController();
  static final TextEditingController toleran7 = TextEditingController();
  static final TextEditingController toleran8 = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  static void hapus() {
    sensitif1.clear();
    sensitif2.clear();
    sensitif3.clear();
    sensitif4.clear();
    sensitif5.clear();
    sensitif6.clear();
    moderat1.clear();
    moderat2.clear();
    moderat3.clear();
    moderat4.clear();
    moderat5.clear();
    moderat6.clear();
    moderat7.clear();
    moderat8.clear();
    moderat9.clear();
    toleran1.clear();
    toleran2.clear();
    toleran3.clear();
    toleran4.clear();
    toleran5.clear();
    toleran6.clear();
    toleran7.clear();
  }

  static int cekJumlahSensitive() {
    int jumlahSensitiv = 0;
    int jumlahMicroba = 0;

    if (sensitif1.text != '' && int.parse(sensitif1.text) != 0) {
      organismeSensitiv['Mayflies Nymph'] = sensitif1.text;
      jumlahMicroba = jumlahMicroba + int.parse(sensitif1.text);
    }
    if (sensitif2.text != '' && int.parse(sensitif2.text) != 0) {
      organismeSensitiv['Caddisfly Larva'] = sensitif2.text;
      jumlahMicroba = jumlahMicroba + int.parse(sensitif2.text);
    }
    if (sensitif3.text != '' && int.parse(sensitif3.text) != 0) {
      organismeSensitiv['Water Penny Beetle Larva'] = sensitif3.text;
      jumlahMicroba = jumlahMicroba + int.parse(sensitif3.text);
    }
    if (sensitif4.text != '' && int.parse(sensitif4.text) != 0) {
      organismeSensitiv['Dobsonfly Pupa'] = sensitif4.text;
      jumlahMicroba = jumlahMicroba + int.parse(sensitif4.text);
    }
    if (sensitif5.text != '' && int.parse(sensitif5.text) != 0) {
      organismeSensitiv['Stoneflies'] = sensitif5.text;
      jumlahMicroba = jumlahMicroba + int.parse(sensitif5.text);
    }
    if (sensitif6.text != '' && int.parse(sensitif6.text) != 0) {
      organismeSensitiv['Most Caddisflies'] = sensitif6.text;
      jumlahMicroba = jumlahMicroba + int.parse(sensitif6.text);
    }
    // if (jumlahSensitiv > 5) {
    //   jumlahSensitiv = 5;
    // }
    jumlahSensitiv = _hitungJumlahIndividu(jlhMikroba: jumlahMicroba);

    return jumlahSensitiv;
  }

  static int cekJumlahModerat() {
    int jumlahModerat = 0;
    int jumlahMicroba = 0;

    if (moderat1.text != '' && int.parse(moderat1.text) != 0) {
      organismeModerat['Damsefly'] = moderat1.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat1.text);
    }
    if (moderat2.text != '' && int.parse(moderat2.text) != 0) {
      organismeModerat['Crayfish'] = moderat2.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat2.text);
    }
    if (moderat3.text != '' && int.parse(moderat3.text) != 0) {
      organismeModerat['Sowbug'] = moderat3.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat3.text);
    }
    if (moderat4.text != '' && int.parse(moderat4.text) != 0) {
      organismeModerat['Water Beetle'] = moderat4.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat4.text);
    }
    if (moderat5.text != '' && int.parse(moderat5.text) != 0) {
      organismeModerat['Dragonfly Nymph'] = moderat5.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat5.text);
    }
    if (moderat6.text != '' && int.parse(moderat6.text) != 0) {
      organismeModerat['Riffle Beetle Adult'] = moderat6.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat6.text);
    }
    if (moderat7.text != '' && int.parse(moderat7.text) != 0) {
      organismeModerat['Flatworm'] = moderat7.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat7.text);
    }
    if (moderat8.text != '' && int.parse(moderat8.text) != 0) {
      organismeModerat['Cranefly Larva'] = moderat8.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat8.text);
    }
    if (moderat9.text != '' && int.parse(moderat9.text) != 0) {
      organismeModerat['Clams'] = moderat9.text;
      jumlahMicroba = jumlahMicroba + int.parse(moderat9.text);
    }
    // if (jumlahModerat > 5) {
    //   jumlahModerat = 5;
    // }
    jumlahModerat = _hitungJumlahIndividu(jlhMikroba: jumlahMicroba);
    return jumlahModerat;
  }

  static int cekJumlahToleran() {
    int jumlahToleran = 0;
    int jumlahMicroba = 0;

    if (toleran1.text != '' && int.parse(toleran1.text) != 0) {
      organismeToleran['Water Snails'] = toleran1.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran1.text);
    }
    if (toleran2.text != '' && int.parse(toleran2.text) != 0) {
      organismeToleran['Simulidae'] = toleran2.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran2.text);
    }
    if (toleran3.text != '' && int.parse(toleran3.text) != 0) {
      organismeToleran['Midge Larva'] = toleran3.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran3.text);
    }
    if (toleran4.text != '' && int.parse(toleran4.text) != 0) {
      organismeToleran['Aquatic Worm'] = toleran4.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran4.text);
    }
    if (toleran5.text != '' && int.parse(toleran5.text) != 0) {
      organismeToleran['Clams'] = toleran5.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran5.text);
    }
    if (toleran6.text != '' && int.parse(toleran6.text) != 0) {
      organismeToleran['Red Tailed Maggot'] = toleran6.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran6.text);
    }
    if (toleran7.text != '' && int.parse(toleran7.text) != 0) {
      organismeToleran['Leeches'] = toleran7.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran7.text);
    }
    if (toleran8.text != '' && int.parse(toleran8.text) != 0) {
      organismeToleran['Scuds'] = toleran8.text;
      jumlahMicroba = jumlahMicroba + int.parse(toleran8.text);
    }
    if (jumlahToleran > 5) {
      jumlahToleran = 5;
    }
    jumlahToleran = _hitungJumlahIndividu(jlhMikroba: jumlahMicroba);
    return jumlahToleran;
  }

  // ignore: unused_element
  static int _hitungJumlahIndividu({required int jlhMikroba}) {
    int hasil = 0;

    if (jlhMikroba <= 0 || jlhMikroba == 1) {
      hasil = jlhMikroba;
    } else if (jlhMikroba >= 2 && jlhMikroba <= 10) {
      hasil = 2;
    } else if (jlhMikroba >= 11 && jlhMikroba <= 100) {
      hasil = 3;
    } else if (jlhMikroba >= 101 && jlhMikroba <= 1000) {
      hasil = 4;
    } else {
      hasil = 5;
    }

    return hasil;
  }
}
