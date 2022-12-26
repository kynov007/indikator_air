import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../app/modules/Jumlah/controllers/jumlah_controller.dart';
import 'access_phone_storage.dart';

class PdfBuilder {
  final pdf = Document();

  static const _sangatBersih = PdfColors.green;
  static const _bersih = PdfColor.fromInt(0xff00B2FF);
  static const _sedang = PdfColor.fromInt(0xffFFF500);
  static const _kotor = PdfColor.fromInt(0xffE3B673);
  static const _sangatKotor = PdfColors.red;

  static _warnaAirBerdasarkanKualitas({required String kualitasAir}) {
    switch (kualitasAir.toUpperCase()) {
      case 'SANGAT BERSIH':
        return _sangatBersih;
      case 'BERSIH':
        return _bersih;
      case 'SEDANG':
        return _sedang;
      case 'KOTOR':
        return _kotor;
      case 'SANGAT KOTOR':
        return _sangatKotor;
    }
  }

  Future<File?> createReport({required String fileName}) async {
    pdf.addPage(
      Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Laporan Kualitas Air',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _warnaAirBerdasarkanKualitas(
                            kualitasAir: JumlahController.kualitasAir.value)),
                  ),
                  SizedBox(width: 10),
                  Text('Kualitas Air = ${JumlahController.kualitasAir.value}'),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                child: Text("Lokasi = ${JumlahController.lokasi.text}"),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(height: 20),
              buatRowOrganisme(
                  nomer: 'No.',
                  namaOrg: 'Nama Organisme',
                  jumlah: 'Jumlah',
                  jenis: 'Jenis',
                  posisiNamaOrgDitengah: true,
                  posisiJumlahDitengah: true),
              Divider(
                thickness: 1,
                color: PdfColors.black,
              ),
              ...buatDaftarSemuaOrganisme()
            ],
          );
        },
      ),
    );

    final bytes = await pdf.save();
    await AccessPhoneStorage.instance
        .saveIntoStorage(fileName: fileName, data: bytes);
    return AccessPhoneStorage.instance.docFile();
  }

  List<Widget> buatDaftarSemuaOrganisme() {
    int nomer = 0;
    List<Widget> semuaData = [];
    String jumlah = '';

    // mencari daftar & jumlah organisme sensitif
    for (final keys in JumlahController.organismeSensitiv.keys) {
      nomer++;
      jumlah = JumlahController.organismeSensitiv[keys];
      semuaData.add(buatRowOrganisme(
          nomer: nomer.toString(), namaOrg: keys, jumlah: jumlah, jenis: 'S'));
    }

    // mencari daftar & jumlah organisme moderat
    for (final keys in JumlahController.organismeModerat.keys) {
      nomer++;
      jumlah = JumlahController.organismeModerat[keys];
      semuaData.add(buatRowOrganisme(
          nomer: nomer.toString(), namaOrg: keys, jumlah: jumlah, jenis: 'M'));
    }
    // mencari daftar & jumlah organisme TOLERAN
    for (final keys in JumlahController.organismeToleran.keys) {
      nomer++;
      jumlah = JumlahController.organismeToleran[keys];
      semuaData.add(buatRowOrganisme(
          nomer: nomer.toString(), namaOrg: keys, jumlah: jumlah, jenis: 'T'));
    }

    return semuaData;
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
