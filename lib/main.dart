import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teus_controle_lite/modules/product/product_bind.dart';
import 'package:teus_controle_lite/modules/product/product_page.dart';
import 'package:teus_controle_lite/modules/product_details/product_details_bind.dart';
import 'package:teus_controle_lite/modules/product_details/product_details_page.dart';
import 'package:teus_controle_lite/modules/product_form/product_form_bind.dart';
import 'package:teus_controle_lite/modules/product_form/product_form_page.dart';
import 'package:teus_controle_lite/project_bind.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ProductPage.id,
      defaultTransition: Transition.native,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.red,
        ).copyWith(
          secondary: Colors.red[900],
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      locale: const Locale('pt', 'BR'),
      initialBinding: ProjectBind(),
      getPages: [
        GetPage(
          name: ProductPage.id,
          page: () => ProductPage(),
          binding: ProductBind(),
        ),
        GetPage(
          name: ProductDetailsPage.id,
          page: () => ProductDetailsPage(),
          binding: ProductDetailsBind(),
        ),
        GetPage(
          name: ProductFormPage.id,
          page: () => ProductFormPage(),
          binding: ProductFormBind(),
        ),
      ],
    ),
  );
}
