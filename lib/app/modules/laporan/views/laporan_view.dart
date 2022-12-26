// ignore_for_file: unused_import, unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../pdf_builder/pdf_builder.dart';
import '../../../data/warna_air.dart';
import '../../Jumlah/controllers/jumlah_controller.dart';
import '../controllers/laporan_controller.dart';

class LaporanView extends GetView<LaporanController> {
  const LaporanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Center(
              child: Text(
                'Laporan Kualitas Air',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: WarnaAir.warnaAirByQuality(
                        kualitasAir: JumlahController.kualitasAir.value),
                  ),
                ),
                const SizedBox(width: 10),
                Text('Kualitas Air = ${JumlahController.kualitasAir.value}'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 40),
              child: Text("Lokasi = ${JumlahController.lokasi.text}"),
            ),
            SizedBox(
              height: 25.h,
            ),
            const NamaOrganisme(),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showInputPdfName(context);
          },
          tooltip: 'save pdf',
          child: const Icon(Icons.save),
        ),
      ),
    );
  }
}

class NamaOrganisme extends StatelessWidget {
  const NamaOrganisme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        buatRowOrganisme(
            nomer: 'No.',
            namaOrg: 'Nama Organisme',
            jumlah: 'Jumlah',
            jenis: 'Jenis',
            posisiNamaOrgDitengah: true,
            posisiJumlahDitengah: true),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        ...daftarOrganismeSensitif(),
        ...daftarOrganismeModerat(),
        ...daftarOrganismeToleran(),
      ],
    );
  }

  List<Widget> daftarOrganismeSensitif() {
    return organismeList(JumlahController.organismeSensitiv, 'S');
  }

  List<Widget> daftarOrganismeModerat() {
    return organismeList(JumlahController.organismeModerat, 'M');
  }

  List<Widget> daftarOrganismeToleran() {
    return organismeList(JumlahController.organismeToleran, 'T');
  }

  List<Widget> organismeList(Map<String, dynamic> data, String jenis) {
    List<Widget> orgList = [];

    for (final keys in data.keys) {
      JumlahController.noUrut++;
      orgList.add(const SizedBox(
        height: 6,
      ));
      orgList.add(buatRowOrganisme(
          nomer: JumlahController.noUrut.toString(),
          namaOrg: keys,
          jumlah: data[keys].toString(),
          jenis: jenis));
      // print('$counter keys: $keys jumlah ${data[keys].toString()}');
    }

    return orgList;
  }

  Row buatRowOrganisme(
      {bool posisiNamaOrgDitengah = false,
      bool posisiJumlahDitengah = false,
      required String nomer,
      required String namaOrg,
      required String jumlah,
      required String jenis}) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: 50, alignment: Alignment.center, child: Text(nomer)),
        Expanded(
          child: Container(
              // width: 100,
              alignment: posisiNamaOrgDitengah
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: Text(namaOrg)),
        ),
        Container(
            width: 70,
            margin: EdgeInsets.only(right: posisiJumlahDitengah ? 0 : 14),
            alignment:
                posisiJumlahDitengah ? Alignment.center : Alignment.bottomRight,
            child: Text(jumlah)),
        Container(width: 50, alignment: Alignment.center, child: Text(jenis)),
      ],
    );
  }
}

showInputPdfName(BuildContext context) {
  TextEditingController namaPdf = TextEditingController();

  // referensi: https://stackoverflow.com/questions/53844052/how-to-make-an-alertdialog-in-flutter

  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text("Batal"),
    onPressed: () {
      Navigator.of(context).pop(); // close dialog
    },
  );

  Widget saveButton = TextButton(
    child: const Text("Simpan"),
    onPressed: () async {
      if (namaPdf.text != '') {
        File? filePdf =
            await PdfBuilder().createReport(fileName: '${namaPdf.text}.pdf');

        if (filePdf!.existsSync()) {
          Navigator.of(context).pop(); // close dialog

          final snackBar = SnackBar(
            content: const Text('Pdf berhasil disimpan'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          JumlahController.hapus();

          Get.offAndToNamed('main-menu');
        } else {
          return;
        }
      } else {
        LaporanController.pesanPdf.value = 'Nama tidak boleh kosong';
      }
    },
  );

  // set up the AlertDialog
  var alert = Get.defaultDialog(
    title: "Nama File PDF",
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() {
          return TextField(
            controller: namaPdf,
            onChanged: (value) {
              if (value == '') {
                LaporanController.pesanPdf.value = 'Nama tidak boleh kosong';
              } else {
                LaporanController.pesanPdf.value = '';
              }
            },
            decoration: InputDecoration(
                labelText: 'Masukkan nama file pdf',
                errorText: LaporanController.pesanPdf.value),
          );
        })
      ],
    ),
    actions: [
      cancelButton,
      saveButton,
    ],
  );

  // show the dialog
  // showDialog(
  //   context: context,
  //   builder: (BuildContext context) {
  //     return alert;
  //   },
  // );
}
