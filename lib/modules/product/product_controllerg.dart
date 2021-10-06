import 'package:get/get.dart';
import 'package:teus_controle_lite/models/get_paged_data.dart';
import 'package:teus_controle_lite/models/product.dart';
import 'package:teus_controle_lite/models/response_data.dart';
import 'package:teus_controle_lite/modules/product_details/product_details_page.dart';
import 'package:teus_controle_lite/modules/product_form/product_form_page.dart';
import 'package:teus_controle_lite/repositories/interfaces/i_product_service.dart';

class ProductControllerG extends GetxController {
  final IProductService service = Get.find();

  final productList = Rxn<List<Product>>();

  final loading = Rx<bool>(false);

  @override
  void onInit() {
    _getProducts();
    super.onInit();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    _getProducts();
    super.update(ids, condition);
  }

  void _getProducts() async {
    ResponseData<GetPagedData> result = await service.getPaged();
    productList.value = result.data?.data ?? [];
  }

  Future<void> deleteProduct(id) async {
    await service.delete(id);
  }

  Future<void> undeleteProduct(id) async {
    await service.undelete(id);
    update();
  }

  void goToForm() {
    Get.toNamed(ProductFormPage.id)?.then((value) => update());
  }

  void goToDetails(product) async {
    Get.toNamed(ProductDetailsPage.id, arguments: product)?.then((value) => update());
  }
}
