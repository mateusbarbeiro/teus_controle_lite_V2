import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:teus_controle_lite/app/exceptions/business_exception.dart';
import 'package:teus_controle_lite/models/product.dart';
import 'package:teus_controle_lite/repositories/cosmos.dart';
import 'package:teus_controle_lite/repositories/interfaces/i_product_service.dart';

class ProductFormControllerG extends GetxController {
  final IProductService service = Get.find();
  final Product? productItem = Get.arguments ?? Product();

  var gtin = TextEditingController();
  var description = TextEditingController();
  var price = TextEditingController();
  var brandName = TextEditingController();
  var gpcCode = TextEditingController();
  var gpcDescription = TextEditingController();
  var ncmCode = TextEditingController();
  var ncmDescription = TextEditingController();
  var ncmFullDescription = TextEditingController();
  var inStock = TextEditingController();
  var thumbnail = TextEditingController();
  // var active = TextEditingController();

  var isValid = true;

  ProductFormControllerG() {
    if (productItem != null) {
      productItem!.gtin != null
          ? gtin.value = TextEditingValue(text: productItem!.gtin.toString())
          : null;

      productItem!.description != null
          ? description.value =
              TextEditingValue(text: productItem!.description.toString())
          : null;
      productItem!.price != null
          ? price.value = TextEditingValue(text: productItem!.price.toString())
          : null;

      productItem!.brandName != null
          ? brandName.value =
              TextEditingValue(text: productItem!.brandName.toString())
          : null;

      productItem!.gpcCode != null
          ? gpcCode.value =
              TextEditingValue(text: productItem!.gpcCode.toString())
          : null;

      productItem!.gpcDescription != null
          ? gpcDescription.value =
              TextEditingValue(text: productItem!.gpcDescription.toString())
          : null;

      productItem!.ncmCode != null
          ? ncmCode.value =
              TextEditingValue(text: productItem!.ncmCode.toString())
          : null;

      productItem!.ncmDescription != null
          ? ncmDescription.value =
              TextEditingValue(text: productItem!.ncmDescription.toString())
          : null;

      productItem!.ncmFullDescription != null
          ? ncmFullDescription.value =
              TextEditingValue(text: productItem!.ncmFullDescription.toString())
          : null;

      productItem!.inStock != null
          ? inStock.value =
              TextEditingValue(text: productItem!.inStock.toString())
          : null;

      productItem!.thumbnail != null
          ? thumbnail.value =
              TextEditingValue(text: productItem!.thumbnail.toString())
          : null;
    }
  }

  String? validateDescription(String? description) {
    try {
      if (description == null || description == '') {
        throw BusinessException('Descrição é obrigatório.');
      }
      isValid = true;
      return null;
    } catch (e) {
      isValid = false;
      return e.toString();
    }
  }

  String? validateGtin(String? gtin) {
    try {
      if (gtin == null || gtin == '') {
        throw BusinessException('Código de barras é obrigatório.');
      }
      isValid = true;
      return null;
    } catch (e) {
      isValid = false;
      return e.toString();
    }
  }

  String? validateStock(String? inStock) {
    try {
      if (inStock == null || inStock == '') {
        throw BusinessException('Quantidade em estoque é obrigatória.');
      }
      isValid = true;
      return null;
    } catch (e) {
      isValid = false;
      return e.toString();
    }
  }

  Future<void> save() async {
    try {
      if (productItem != null) {
        var result = await service.save(productItem!);

        if (result.status == false) {
          throw BusinessException(result.messages.toString());
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void onGtinChanged(value) async {
    if (value.length == 8 || (value.length >= 12 && value.length <= 14)) {
      var product = await Cosmos().requestGetProduct(value);

      description.value = TextEditingValue(text: product.description ?? '');
      price.value = TextEditingValue(text: _treatPriceString(product.price));
      brandName.value = TextEditingValue(text: product.brand?.name ?? '');
      gpcCode.value = TextEditingValue(text: product.gpc?.code ?? '');
      gpcDescription.value = TextEditingValue(text: product.gpc?.description ?? '');
      ncmCode.value  = TextEditingValue(text: product.ncm?.code ?? '');
      ncmDescription.value  = TextEditingValue(text: product.ncm?.description ?? '');
      ncmFullDescription.value = TextEditingValue(text: product.ncm?.fullDescription ?? '');
      thumbnail.value = TextEditingValue(text: product.thumbnail ?? '');
    }
  }

  String _treatPriceString(String? value) {
    // formato esperado "R$ 2,99",
    if (value == null || value == '') {
      return '0';
    } else {
      value = value.replaceAll(',', '.');
      value = value.replaceAll('R\$ ', '');
      var list = value.split('a');
      return list[0];
    }
  }
}
