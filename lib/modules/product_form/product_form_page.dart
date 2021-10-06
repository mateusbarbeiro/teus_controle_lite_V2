import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:teus_controle_lite/app/constants.dart';
import 'package:teus_controle_lite/app/widgets/text_field_item.dart';
import 'package:teus_controle_lite/modules/product_form/product_form_controller.dart';

class ProductFormPage extends StatelessWidget {
  static String id = "/product-form";

  final _form = GlobalKey<FormState>();
  final ProductFormControllerG controller = Get.find();

  ProductFormPage({Key? key}) : super(key: key);

  List<TextFieldItem> productTextFields() {
    return <TextFieldItem>[
      TextFieldItem(
        "Código de barras",
        controller: controller.gtin,
        keyboardType: TextInputType.number,
        validator: controller.validateGtin,
        onSaved: (value) {
          controller.productItem?.gtin = value;
        },
        onChanged: controller.onGtinChanged,
      ),
      TextFieldItem(
        "Descrição",
        controller: controller.description,
        keyboardType: TextInputType.text,
        validator: controller.validateDescription,
        onSaved: (value) {
          controller.productItem?.description = value;
        },
      ),
      TextFieldItem(
        "Preço",
        controller: controller.price,
        keyboardType: TextInputType.number,
        onSaved: (value) {
          controller.productItem?.price =
              double.parse(value == null || value == "" ? "0" : value);
        },
      ),
      TextFieldItem(
        "Marca",
        controller: controller.brandName,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          controller.productItem?.brandName = value;
        },
      ),
      TextFieldItem(
        "Código GPC",
        controller: controller.gpcCode,
        keyboardType: TextInputType.number,
        onSaved: (value) {
          controller.productItem?.gpcCode = value;
        },
      ),
      TextFieldItem(
        "Descrição da GPC",
        controller: controller.gpcDescription,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          controller.productItem?.gpcDescription = value;
        },
      ),
      TextFieldItem(
        "Código NCM",
        controller: controller.ncmCode,
        keyboardType: TextInputType.number,
        onSaved: (value) {
          controller.productItem?.ncmCode = value;
        },
      ),
      TextFieldItem(
        "Descrição da NCM",
        controller: controller.ncmDescription,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          controller.productItem?.ncmDescription = value;
        },
      ),
      TextFieldItem(
        "Descrição completa da NCM",
        controller: controller.ncmFullDescription,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          controller.productItem?.ncmFullDescription = value;
        },
      ),
      TextFieldItem(
        "Quantidade",
        controller: controller.inStock,
        keyboardType: TextInputType.number,
        validator: controller.validateStock,
        onSaved: (value) {
          controller.productItem?.inStock =
              int.parse(value == null || value == "" ? "0" : value);
        },
      ),
      TextFieldItem(
        "Url Imagem",
        controller: controller.thumbnail,
        keyboardType: TextInputType.text,
        onSaved: (value) {
          controller.productItem?.thumbnail = value;
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CADASTRO DE PRODUTO",
          style: kTitleStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () async {
              _form.currentState?.validate();
              _form.currentState?.save();
              if (controller.isValid) {
                await controller.save();
                Get.back();
              }
            },
          )
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: productTextFields(),
        ),
      ),
    );
  }
}
