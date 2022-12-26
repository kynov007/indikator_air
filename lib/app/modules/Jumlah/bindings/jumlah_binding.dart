import 'package:get/get.dart';

import '../controllers/jumlah_controller.dart';

class JumlahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JumlahController>(
      () => JumlahController(),
    );
  }
}
