import 'package:dio/dio.dart';
import 'package:teus_controle_lite/models/product.dart';
import 'package:teus_controle_lite/models/response_data.dart';
import 'package:teus_controle_lite/repositories/dio_config.dart';
import 'package:teus_controle_lite/models/get_paged_data.dart';

import 'interfaces/i_product_service.dart';

// todo: verificar status do retorno e se falso, jogar exceção
class ProductService implements IProductService {
  final Dio dio = DioConfig.builderConfig();

  @override
  Future<ResponseData> delete(id) async {
    try {
      var response = await dio.delete(
        "api/products/delete",
        options: Options(headers: {"id": id}),
      );

      return ResponseData.fromJson(response.data);
    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<ResponseData<GetPagedData>> getPaged() async {
    try {
      var response = await dio.post(
        "api/products/getpaged",
        data: {
          "pageNumber": 1,
          "pageSize": 50,
        },
      );

      ResponseData result = ResponseData.fromJson(response.data);
      GetPagedData data = GetPagedData.fromJson(response.data['data']);

      return ResponseData<GetPagedData>(
        status: result.status,
        messages: result.messages,
        timeStamp: result.timeStamp,
        data: data
      );

    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<ResponseData<Product>> findById(id) async {
    try {
      var response = await dio.get(
        "api/products/getbyid",
        options: Options(
          headers: {
            "id": id
          }
        ),
      );

      ResponseData result = ResponseData.fromJson(response.data) ;
      Product data = Product.fromJson(response.data['data']);
      
      return ResponseData<Product>(
        status: result.status,
        messages: result.messages,
        timeStamp: result.timeStamp,
        data: data
      );
    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<ResponseData> save(Product product) async {
    try {
      ResponseData result;
      // se tiver id, atualiza
      if(product.id != null) {
        var response  = await dio.put(
          "api/products/update",
          data: {
            "gtin": product.gtin,
            "description": product.description,
            "price": product.price,
            "brandName": product.brandName,
            "gpcCode": product.gpcCode,
            "gpcDescription": product.gpcDescription,
            "ncmCode": product.ncmCode,
            "ncmDescription": product.ncmDescription,
            "ncmFullDescription": product.ncmFullDescription,
            "thumbnail": product.thumbnail,
            "inStock": product.inStock,
            "id": product.id,
            "active": product.active
          },
        );
        result =  ResponseData.fromJson(response.data);
      // se não, insere
      } else {
        var response = await dio.post(
          "api/products/insert",
          data: {
            "gtin": product.gtin,
            "description": product.description,
            "price": product.price,
            "brandName": product.brandName,
            "gpcCode": product.gpcCode,
            "gpcDescription": product.gpcDescription,
            "ncmCode": product.ncmCode,
            "ncmDescription": product.ncmDescription,
            "ncmFullDescription": product.ncmFullDescription,
            "thumbnail": product.thumbnail,
            "inStock": product.inStock
          },
        );
        result =  ResponseData.fromJson(response.data);
      }
      return result;
    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }
  }

  @override
  Future<ResponseData> undelete(id) async {
    try {
      var response = await dio.post(
        "api/products/undelete",
        options: Options(
          headers: {
            "id": id
          }
        )
      );
      return ResponseData.fromJson(response.data);
    } catch (e) {
      throw Exception("Ocorreu um erro: ${e.toString()}");
    }    
  }

  // List<String> _treatMessages(List<dynamic> values) {
  //   List<String> messages = [];
  //   for (var item in values) {
  //     messages.add(item['message']);
  //   }
  //   return messages;
  // }
}