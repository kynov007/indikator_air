import 'package:get/get.dart';

import '../modules/Jumlah/bindings/jumlah_binding.dart';
import '../modules/Jumlah/views/jumlah_view.dart';
import '../modules/Main_Menu/bindings/main_menu_binding.dart';
import '../modules/Main_Menu/views/main_menu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laporan/bindings/laporan_binding.dart';
import '../modules/laporan/views/laporan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_MENU,
      page: () => MainMenuView(),
      binding: MainMenuBinding(),
    ),
    GetPage(
      name: _Paths.JUMLAH,
      page: () => const JumlahView(),
      binding: JumlahBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN,
      page: () => const LaporanView(),
      binding: LaporanBinding(),
    ),
  ];
}
