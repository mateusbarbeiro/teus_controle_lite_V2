import 'package:get/get.dart';
import 'package:teus_controle_lite/repositories/interfaces/i_product_service.dart';
import 'package:teus_controle_lite/repositories/product_service.dart';

class ProjectBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProductService>(() {
      return ProductService();
    });
  }
}