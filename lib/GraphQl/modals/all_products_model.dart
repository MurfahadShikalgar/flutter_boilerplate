// ignore_for_file: unnecessary_this, prefer_collection_literals

class AllProductsModel {
  List<AllProductData>? edges;

  AllProductsModel({this.edges});

  AllProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = <AllProductData>[];
      json['edges'].forEach((v) {
        edges!.add(AllProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.edges != null) {
      data['edges'] = this.edges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllProductData {
  ProductData? node;

  AllProductData({this.node});

  AllProductData.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? ProductData.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node!.toJson();
    }
    return data;
  }
}

class ProductData {
  String? id;
  String? name;
  String? description;

  ProductData({this.id, this.name, this.description});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}