import 'package:get/get.dart';
import 'package:teus_controle_lite/modules/product_form/product_form_controller.dart';

class ProductFormBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductFormControllerG>(() {
      // final String x = "";
      return ProductFormControllerG();
      // final ProductService x = ProductService();
    });
  }
}