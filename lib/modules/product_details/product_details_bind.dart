import 'package:get/get.dart';
import 'package:teus_controle_lite/modules/product_details/product_details_controllerg.dart';

class ProductDetailsBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsControllerG>(() {
      // final String x = "";
      return ProductDetailsControllerG();
      // final ProductService x = ProductService();
    });
  }
}