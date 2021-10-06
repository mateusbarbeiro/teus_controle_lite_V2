class Product {
  int? id;
  String? gtin;
  String? description;
  double? price;
  String? brandName;
  String? gpcCode;
  String? gpcDescription;
  String? ncmCode;
  String? ncmDescription;
  String? ncmFullDescription;
  String? thumbnail;
  int? inStock;
  bool? active;
  bool? deleted;
  String? createdDate;
  String? lastChange;

  Product({
    this.id,
    this.gtin,
    this.description,
    this.price,
    this.brandName,
    this.gpcCode,
    this.gpcDescription,
    this.ncmCode,
    this.ncmDescription,
    this.ncmFullDescription,
    this.thumbnail,
    this.inStock,
    this.active,
    this.deleted,
    this.createdDate,
    this.lastChange,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gtin = json['gtin'];
    description = json['description'];
    price = json['price'];
    brandName = json['brandName'];
    gpcCode = json['gpcCode'];
    gpcDescription = json['gpcDescription'];
    ncmCode = json['ncmCode'];
    ncmDescription = json['ncmDescription'];
    ncmFullDescription = json['ncmFullDescription'];
    thumbnail = json['thumbnail'];
    inStock = json['inStock'];
    active = json['active'];
    deleted = json['deleted'];
    createdDate = json['createdDate'];
    lastChange = json['lastChange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gtin'] = gtin;
    data['description'] = description;
    data['price'] = price;
    data['brandName'] = brandName;
    data['gpcCode'] = gpcCode;
    data['gpcDescription'] = gpcDescription;
    data['ncmCode'] = ncmCode;
    data['ncmDescription'] = ncmDescription;
    data['ncmFullDescription'] = ncmFullDescription;
    data['thumbnail'] = thumbnail;
    data['inStock'] = inStock;
    data['id'] = id;
    data['active'] = active;
    data['deleted'] = deleted;
    data['createdDate'] = createdDate;
    data['lastChange'] = lastChange;
    return data;
  }
}
