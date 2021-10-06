import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teus_controle_lite/models/product_cosmos_response.dart';

class Cosmos {
  Future<ProductCosmosResponse> requestGetProduct(String gtin) async {
    var result = await http.get(
      Uri.parse('https://api.cosmos.bluesoft.com.br/gtins/$gtin'),
      headers: {'X-Cosmos-Token': 'OURNoMwt8fatVpPQ6iR3VA'},
    );

    return ProductCosmosResponse.fromJson(jsonDecode(result.body));
  }
}
