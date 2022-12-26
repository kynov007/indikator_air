import 'package:flutter/material.dart';

class WarnaAir {
  static const SangatBersih = Color(0xff00B2FF);
  static const Bersih = Colors.green;
  static const Sedang = Color(0xffFFF500);
  static const Kotor = Color(0xffE3B673);
  static const SangatKotor = Colors.red;

  static warnaAirByQuality({required String kualitasAir}) {
    switch (kualitasAir.toUpperCase()) {
      case 'SANGAT BERSIH':
        return SangatBersih;
      case 'BERSIH':
        return Bersih;
      case 'SEDANG':
        return Sedang;
      case 'KOTOR':
        return Kotor;
      case 'SANGAT KOTOR':
        return SangatKotor;
    }
  }
}
