// To parse this JSON data, do
//
//     final urunDetay = urunDetayFromJson(jsonString);

import 'dart:convert';

UrunDetay urunDetayFromJson(String str) => UrunDetay.fromJson(json.decode(str));

String urunDetayToJson(UrunDetay data) => json.encode(data.toJson());

class UrunDetay {
  UrunDetay({
    this.categories,
    this.product,
    this.pictures,
    this.companies,
  });

  List<Category> categories;
  Product product;
  List<Picture> pictures;
  List<Category> companies;

  factory UrunDetay.fromJson(Map<String, dynamic> json) => UrunDetay(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        product: Product.fromJson(json["product"]),
        pictures: List<Picture>.from(
            json["pictures"].map((x) => Picture.fromJson(x))),
        companies: List<Category>.from(
            json["companies"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "product": product.toJson(),
        "pictures": List<dynamic>.from(pictures.map((x) => x.toJson())),
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.kdv,
    this.logoPhotoPath,
    this.state,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  int id;
  String name;
  String slug;
  String kdv;
  String logoPhotoPath;
  String state;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String type;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        kdv: json["kdv"] == null ? null : json["kdv"],
        logoPhotoPath: json["logo_photo_path"],
        state: json["state"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "kdv": kdv == null ? null : kdv,
        "logo_photo_path": logoPhotoPath,
        "state": state,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "type": type == null ? null : type,
      };
}

class Picture {
  Picture({
    this.id,
    this.imagePath,
    this.productId,
    this.state,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String imagePath;
  String productId;
  String state;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        id: json["id"],
        imagePath: json["image_path"],
        productId: json["product_id"],
        state: json["state"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_path": imagePath,
        "product_id": productId,
        "state": state,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Product {
  Product({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.companyId,
    this.barcode,
    this.name,
    this.slug,
    this.imagePath,
    this.description,
    this.unit,
    this.unitType,
    this.purchasePrice,
    this.salePrice,
    this.discount,
    this.stock,
    this.stockType,
    this.clicks,
    this.state,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String categoryId;
  String subCategoryId;
  String companyId;
  String barcode;
  String name;
  String slug;
  String imagePath;
  dynamic description;
  String unit;
  String unitType;
  String purchasePrice;
  String salePrice;
  String discount;
  String stock;
  String stockType;
  String clicks;
  String state;
  dynamic deletedAt;
  String createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
        companyId: json["company_id"],
        barcode: json["barcode"],
        name: json["name"],
        slug: json["slug"],
        imagePath: json["image_path"],
        description: json["description"],
        unit: json["unit"],
        unitType: json["unit_type"],
        purchasePrice: json["purchase_price"],
        salePrice: json["sale_price"],
        discount: json["discount"],
        stock: json["stock"],
        stockType: json["stock_type"],
        clicks: json["clicks"],
        state: json["state"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
        "company_id": companyId,
        "barcode": barcode,
        "name": name,
        "slug": slug,
        "image_path": imagePath,
        "description": description,
        "unit": unit,
        "unit_type": unitType,
        "purchase_price": purchasePrice,
        "sale_price": salePrice,
        "discount": discount,
        "stock": stock,
        "stock_type": stockType,
        "clicks": clicks,
        "state": state,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
