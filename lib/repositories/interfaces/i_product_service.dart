import 'package:teus_controle_lite/models/product.dart';
import 'package:teus_controle_lite/models/response_data.dart';
import 'package:teus_controle_lite/models/get_paged_data.dart';

abstract class IProductService {
  Future<ResponseData> delete(id);

  Future<ResponseData<GetPagedData>> getPaged();

  Future<ResponseData<Product>> findById(id);

  Future<ResponseData> save(Product product);

  Future<ResponseData> undelete(id);
}