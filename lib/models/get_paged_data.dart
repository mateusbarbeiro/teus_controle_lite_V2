import 'package:teus_controle_lite/models/product.dart';

class GetPagedData {
  List<Product>? data;
  int? pageIndex;
  int? totalPages;
  int? totalItems;
  bool? hasPreviousPage;
  bool? hasNextPage;

  GetPagedData({
    this.data,
    this.pageIndex,
    this.totalPages,
    this.totalItems,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  GetPagedData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(Product.fromJson(v));
      });
    }
    pageIndex = json['pageIndex'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> convertedData = <String, dynamic>{};
    if (data != null) {
      convertedData['data'] = data!.map((v) => v.toJson()).toList();
    }
    convertedData['pageIndex'] = pageIndex;
    convertedData['totalPages'] = totalPages;
    convertedData['totalItems'] = totalItems;
    convertedData['hasPreviousPage'] = hasPreviousPage;
    convertedData['hasNextPage'] = hasNextPage;
    return convertedData;
  }
}
