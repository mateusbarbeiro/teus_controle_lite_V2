import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:teus_controle_lite/models/product.dart';
import 'package:teus_controle_lite/modules/product_form/product_form_page.dart';
import 'package:teus_controle_lite/repositories/interfaces/i_product_service.dart';

class ProductDetailsControllerG extends GetxController {
  final IProductService service = Get.find();
  var productItem = Rxn<Product>(Get.arguments);
  bool loading = true;

  Future<void> refreshData() async {
    var result = await service.findById(productItem.value?.id);
    productItem.value = result.data;
  }

  goToForm(Product? product) {
    Get.toNamed(ProductFormPage.id, arguments: product)?.then(
      (value) async {
        await refreshData();
      },
    );
  }
}
