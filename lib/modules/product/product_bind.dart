import 'package:get/get.dart';
import 'package:teus_controle_lite/modules/product/product_controllerg.dart';

class ProductBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductControllerG>(() {
      // final String x = "";
      return ProductControllerG();
      // final ProductService x = ProductService();
    });
  }
}