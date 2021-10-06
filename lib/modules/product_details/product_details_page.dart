import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:teus_controle_lite/app/util/launch_app.dart';
import 'package:teus_controle_lite/app/widgets/sliver_image_app_bar.dart';
import 'package:teus_controle_lite/models/product.dart';
import 'package:teus_controle_lite/modules/product_details/product_details_controllerg.dart';

class ProductDetailsPage extends StatelessWidget {
  static String id = "/product-details";

  ProductDetailsPage({Key? key}) : super(key: key);

  final ProductDetailsControllerG controller = Get.find();

  List<Widget> productDetailsProperties(
    BuildContext context,
    Product item,
    double width,
  ) {
    return <Widget>[
      ListTile(
        title: const Text('Código de barras'),
        subtitle: Text('${item.gtin}'),
      ),
      ListTile(
        title: const Text('Descrição'),
        subtitle: Text('${item.description}'),
      ),
      ListTile(
        title: const Text('Preço'),
        subtitle: Text('${item.price}'),
      ),
      ListTile(
        title: const Text('Marca'),
        subtitle: Text('${item.brandName}'),
      ),
      ListTile(
        title: const Text('Código da GPC'),
        subtitle: Text('${item.gpcCode}'),
      ),
      ListTile(
        title: const Text('Descrição da GPC'),
        subtitle: Text('${item.gpcDescription}'),
      ),
      ListTile(
        title: const Text('Código da NCM'),
        subtitle: Text('${item.ncmCode}'),
      ),
      ListTile(
        title: const Text('Descrição da NCM'),
        subtitle: Text('${item.ncmDescription}'),
      ),
      ListTile(
        title: const Text('Descrição completa da NCM'),
        subtitle: Text('${item.ncmFullDescription}'),
      ),
      ListTile(
        title: const Text('Quantidade em estoque'),
        subtitle: Text('${item.inStock}'),
      ),
      ListTile(
        title: const Text('Imagem do produto (URL)'),
        subtitle: Text('${item.thumbnail}'),
        trailing: SizedBox(
          width: width / 4,
          child: IconButton(
            onPressed: item.thumbnail != null || item.thumbnail != ''
                ? () async {
                    await launchApp(
                      context,
                      '${item.thumbnail}',
                    );
                  }
                : null,
            icon: const Icon(Icons.web_asset),
            color: Colors.red,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var product = controller.productItem.value;
        
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            var width = constraints.biggest.width;

            return Hero(
              tag: "card${product?.id}",
              child: Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder: (_, __) => <Widget>[
                    SliverImageAppBar(
                      imageSrc: product?.thumbnail,
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            controller.goToForm(product);
                          },
                        ),
                      ],
                    )
                  ],
                  body: ListView(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                    children: productDetailsProperties(
                        context, product ?? Product(), width),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
