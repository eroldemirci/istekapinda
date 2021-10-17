// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) =>
    List<ProductListModel>.from(
        json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
  ProductListModel({
    this.categories,
    this.products,
    this.subCategories,
    this.companies,
  });

  List<Category> categories;
  List<Product> products;
  List<Category> subCategories;
  List<Category> companies;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        products: json["products"] == null
            ? null
            : List<Product>.from(
                json["products"].map((x) => Product.fromJson(x))),
        subCategories: json["sub_categories"] == null
            ? null
            : List<Category>.from(
                json["sub_categories"].map((x) => Category.fromJson(x))),
        companies: json["companies"] == null
            ? null
            : List<Category>.from(
                json["companies"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
        "sub_categories": subCategories == null
            ? null
            : List<dynamic>.from(subCategories.map((x) => x.toJson())),
        "companies": companies == null
            ? null
            : List<dynamic>.from(companies.map((x) => x.toJson())),
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
    this.categoryId,
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
  String categoryId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        kdv: json["kdv"] == null ? null : json["kdv"],
        logoPhotoPath:
            json["logo_photo_path"] == null ? null : json["logo_photo_path"],
        state: json["state"] == null ? null : json["state"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        type: json["type"] == null ? null : json["type"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "kdv": kdv == null ? null : kdv,
        "logo_photo_path": logoPhotoPath == null ? null : logoPhotoPath,
        "state": state == null ? null : state,
        "deleted_at": deletedAt,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "type": type == null ? null : type,
        "category_id": categoryId == null ? null : categoryId,
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
  UnitType unitType;
  String purchasePrice;
  String salePrice;
  String discount;
  String stock;
  StockType stockType;
  String clicks;
  String state;
  dynamic deletedAt;
  CreatedAt createdAt;
  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        subCategoryId:
            json["sub_category_id"] == null ? null : json["sub_category_id"],
        companyId: json["company_id"] == null ? null : json["company_id"],
        barcode: json["barcode"] == null ? null : json["barcode"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        imagePath: json["image_path"] == null ? null : json["image_path"],
        description: json["description"],
        unit: json["unit"] == null ? null : json["unit"],
        unitType: json["unit_type"] == null
            ? null
            : unitTypeValues.map[json["unit_type"]],
        purchasePrice:
            json["purchase_price"] == null ? null : json["purchase_price"],
        salePrice: json["sale_price"] == null ? null : json["sale_price"],
        discount: json["discount"] == null ? null : json["discount"],
        stock: json["stock"] == null ? null : json["stock"],
        stockType: json["stock_type"] == null
            ? null
            : stockTypeValues.map[json["stock_type"]],
        clicks: json["clicks"] == null ? null : json["clicks"],
        state: json["state"] == null ? null : json["state"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : createdAtValues.map[json["created_at"]],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category_id": categoryId == null ? null : categoryId,
        "sub_category_id": subCategoryId == null ? null : subCategoryId,
        "company_id": companyId == null ? null : companyId,
        "barcode": barcode == null ? null : barcode,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "image_path": imagePath == null ? null : imagePath,
        "description": description,
        "unit": unit == null ? null : unit,
        "unit_type": unitType == null ? null : unitTypeValues.reverse[unitType],
        "purchase_price": purchasePrice == null ? null : purchasePrice,
        "sale_price": salePrice == null ? null : salePrice,
        "discount": discount == null ? null : discount,
        "stock": stock == null ? null : stock,
        "stock_type":
            stockType == null ? null : stockTypeValues.reverse[stockType],
        "clicks": clicks == null ? null : clicks,
        "state": state == null ? null : state,
        "deleted_at": deletedAt,
        "created_at":
            createdAt == null ? null : createdAtValues.reverse[createdAt],
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

enum CreatedAt { THE_0000011129_T22_0408000000_Z }

final createdAtValues = EnumValues({
  "-000001-11-29T22:04:08.000000Z": CreatedAt.THE_0000011129_T22_0408000000_Z
});

enum StockType { ADET, PAKET }

final stockTypeValues =
    EnumValues({"adet": StockType.ADET, "paket": StockType.PAKET});

enum UnitType { G, KG, L, ADET }

final unitTypeValues = EnumValues({
  "adet": UnitType.ADET,
  "g": UnitType.G,
  "kg": UnitType.KG,
  "L": UnitType.L
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
