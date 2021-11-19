// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

import 'package:clean/domain/entities/product.dart';

ProductData productModelFromJson(String str) =>
    ProductData.fromJson(json.decode(str));

String productModelToJson(ProductData data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.status,
    required this.data,
  });

  int status;
  List<ProductData> data;

  factory ProductModel.fromJson(Map<dynamic, dynamic> json) => ProductModel(
        status: json["status"] == null ? null : json["status"],
        data: List<ProductData>.from(
            json["data"].map((x) => ProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductData extends Product {
  ProductData({
    required this.id,
    required this.productCategoryId,
    required this.name,
    required this.producer,
    required this.description,
    required this.cost,
    required this.rating,
    required this.viewCount,
    required this.created,
    required this.modified,
    required this.productImages,
  }) : super(
          id: id,
          productCategoryId: productCategoryId,
          name: name,
          producer: producer,
          description: description,
          cost: cost,
          rating: rating,
          viewCount: viewCount,
          created: created,
          modified: modified,
          productImages: productImages,
        );

  num id;
  num productCategoryId;
  String name;
  String producer;
  String description;
  num cost;
  num rating;
  num viewCount;
  String created;
  String modified;
  String productImages;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"] == null ? null : json["id"],
        productCategoryId: json["product_category_id"] == null
            ? null
            : json["product_category_id"],
        name: json["name"] == null ? null : json["name"],
        producer: json["producer"] == null ? null : json["producer"],
        description: json["description"] == null ? null : json["description"],
        cost: json["cost"] == null ? null : json["cost"],
        rating: json["rating"] == null ? null : json["rating"],
        viewCount: json["view_count"] == null ? null : json["view_count"],
        created: json["created"] == null ? null : json["created"],
        modified: json["modified"] == null ? null : json["modified"],
        productImages:
            json["product_images"] == null ? null : json["product_images"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_category_id": productCategoryId,
        "name": name,
        "producer": producer,
        "description": description,
        "cost": cost,
        "rating": rating,
        "view_count": viewCount,
        "created": created,
        "modified": modified,
        "product_images": productImages,
      };
}
