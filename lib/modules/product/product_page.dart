import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:teus_controle_lite/app/constants.dart';
import 'package:teus_controle_lite/app/widgets/cart_item.dart';
import 'package:teus_controle_lite/app/widgets/dismissible_item.dart';
import 'package:teus_controle_lite/app/widgets/snack_bar_item.dart';
import 'package:teus_controle_lite/models/product.dart';
import 'package:teus_controle_lite/modules/product/product_controllerg.dart';

class ProductPage extends StatelessWidget {
  static String id = "/product";
  ProductPage({Key? key}) : super(key: key);

  final ProductControllerG controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PRODUTOS",
          style: kTitleStyle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.goToForm(),
        child: const Icon(Icons.add),
      ),
      body: Obx(
        () {
          List<Product>? list = controller.productList.value;
          if (list == null) {
            return Container();
          }
          return ModalProgressHUD(
            inAsyncCall: controller.loading.value,
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var product = list[index];

                return Hero(
                  tag: "card${product.id}",
                  child: DismissibleItem(
                    onDismissed: () async {
                      await controller.deleteProduct(product.id);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarItem(
                          title: "${product.gtin} deletado",
                          context: context,
                          buttonLabel: "Desfazer",
                          onActionPressed: () async {
                            await controller.undeleteProduct(product.id);
                          },
                        ).customSnackbar(),
                      );
                    },
                    backgroundIcon: Icons.delete,
                    dismissibleWidget: CardItem(
                      description: product.description ?? "",
                      title: product.price == null || product.price == 0
                          ? "0.0"
                          : product.price.toString(),
                      imageScr: product.thumbnail,
                      onPressed: () {
                        controller.goToDetails(product);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
