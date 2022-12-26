import 'package:flutter/material.dart';

class KualitasAir {
  List<List<int>> _table = [];

  // singleton
  KualitasAir._privateCont();
  static final instance = KualitasAir._privateCont();

  factory KualitasAir() {
    return instance;
  }

  // method untuk membuat tabel kualitas air dan tabel yang sudah dibuat disimpan di variabel _table
  void _buatTabel() {
    String tabel;
    int counter;
    int bersih = -1;
    int tmpBersih = 0;
    int kualitas = 0;
    int nilaiToleran = 0;
    List<int> sensitifValue = [];
    List<int> moderateValue = [];
    List<List<int>> toleranValue = [];

    debugPrint('Membuat table kualitas air');

    for (int row = 0; row < 8; row++) {
      tabel = '';
      counter = -1;
      for (int col = 0; col < 36; col++) {
        if (row == 0) {
          // disini nilai row (index) diibaratkan = sensitif
          if (col % 6 == 0) {
            counter++;
          }
          tabel = tabel + '$counter ';
          sensitifValue.add(counter);
        }
        else if (row == 1) {
          // disini nilai row (index) diibaratkan = moderat
          tabel = tabel + '${col % 6} ';
          moderateValue.add(col % 6);
        }
        else {
          // disini nilai row diibaratkan = Toleran
          // nilai toleran: 5 = sangat kotor, 4 = kotor, 3 = sedang, 2 = bersih, 1 = sangat bersih

          if (row == 2) {
            // row = 2 --> toleran = 0
            if (col < 6) {
              kualitas = 3;
            }
            else {
              counter++;

              if (counter % 6 == 0) {
                kualitas = 2;
                bersih++;
                tmpBersih = bersih;
              }
              else {
                if (tmpBersih > 0) {
                  tmpBersih--;
                  kualitas = 2;
                }
                else {
                  kualitas = 1;
                }
              }
            }
          }
          else if (row == 3) {
            // row = 3 --> toleran = 1
            if (col == 0) {
              kualitas = 5;
            }
            else if (col == 1 || col == 2) {
              kualitas = 4;
            }
            else if (col > 2 && col < 18) {
              kualitas = 3;
            }
            else if (col == 24 || col == 30 || col == 31) {
              kualitas = 2;
            }
            else {
              kualitas = 1;
            }
          }
          else if (row == 4) {
            // row =4 --> toleran = 2
            if (col == 0) {
              kualitas = 5;
            }
            else if (col == 1 || col == 2) {
              kualitas = 4;
            }
            else if (col > 2 && col < 18) {
              kualitas = 3;
            }
            else {
              kualitas = 1;
            }
          }
          else if (row == 5) {
            // row = 5 --> toleran = 3
            if (col == 0) {
              kualitas = 5;
            }
            else if (col == 1 || col == 2 || col == 3 || col == 6) {
              kualitas = 4;
            }
            else if (col >= 24) {
              kualitas = 1;
            }
            else {
              kualitas = 3;
            }
          }
          else if (row == 6) {
            // row = 6 --> toleran 4
            if (col == 0 || col == 1) {
              kualitas = 5;
            }
            else if (col == 2 || col == 3 || col == 4 || col == 6 || col == 7) {
              kualitas = 4;
            }
            else if (col >= 30) {
              kualitas = 1;
            }
            else {
              kualitas = 3;
            }
          }
          else if (row == 7) {
            // row = 7 --> toleran = 5
            if (col == 0 || col == 1) {
              kualitas = 5;
            }
            else if (col >= 2 && col <= 8) {
              kualitas = 4;
            }
            else {
              kualitas = 3;
            }
          }

          tabel = tabel + '$kualitas ';
          nilaiToleran = row - 2;
          toleranValue.add([nilaiToleran, kualitas]);
        }

      }
      // print(tabel);
    }

    // penggabungan nilai sensitif, moderat dan toleran menjadi satu list
    List<List<int>> finalResult = [];
    counter = 0;
    for (var value in toleranValue) {
      finalResult.add([sensitifValue[counter % 36], moderateValue[counter % 36], value[0], value[1]]);
      counter++;
    }

    // print(finalResult);
    _table.clear();
    _table.addAll(finalResult);
  }

  // function untuk mengecek kualitas air, ada 3 inputan dan outputnya berupa kualitas airnya
  String cekKualitasAir({required int sensitif, required int moderat, required int toleran}) {
    String result = '';

    // jika nilai list table masih kosong, maka buat data tabel terlebih dahulu
    if (_table.isEmpty) {
      _buatTabel();
    }

    debugPrint('Mencari nilai kualitas air');
    // cari kualitas air sesuai dengan sensitif, moderate & toleran yang diinput
    for (var value in _table) {
      if (value[0] == sensitif && value[1] == moderat && value[2] == toleran) {
        switch (value[3]) {
          case 1: result = 'Sangat Bersih'; break;
          case 2: result = 'Bersih'; break;
          case 3: result = 'Sedang'; break;
          case 4: result = 'Kotor'; break;
          case 5: result = 'Sangat Kotor'; break;
        }
      }
    }

    return result;
  }
}