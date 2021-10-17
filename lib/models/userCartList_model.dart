class UserCartList {
  List<Carts> carts;
  List<Products> products;
  String total;

  UserCartList({this.carts, this.products, this.total});

  UserCartList.fromJson(Map<String, dynamic> json) {
    if (json['carts'] != null) {
      carts = new List<Carts>();
      json['carts'].forEach((v) {
        carts.add(new Carts.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.carts != null) {
      data['carts'] = this.carts.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    return data;
  }
}

class Carts {
  int id;
  String userId;
  String productId;
  String orderId;
  String quantity;
  String price;
  String total;
  String state;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  Carts(
      {this.id,
      this.userId,
      this.productId,
      this.orderId,
      this.quantity,
      this.price,
      this.total,
      this.state,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    orderId = json['order_id'];
    quantity = json['quantity'];
    price = json['price'];
    total = json['total'];
    state = json['state'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['order_id'] = this.orderId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['total'] = this.total;
    data['state'] = this.state;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Products {
  int id;
  String categoryId;
  String subCategoryId;
  String companyId;
  String barcode;
  String name;
  String slug;
  String imagePath;
  Null description;
  String unit;
  String unitType;
  String purchasePrice;
  String salePrice;
  String discount;
  String stock;
  String stockType;
  String clicks;
  String state;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  Products(
      {this.id,
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
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    companyId = json['company_id'];
    barcode = json['barcode'];
    name = json['name'];
    slug = json['slug'];
    imagePath = json['image_path'];
    description = json['description'];
    unit = json['unit'];
    unitType = json['unit_type'];
    purchasePrice = json['purchase_price'];
    salePrice = json['sale_price'];
    discount = json['discount'];
    stock = json['stock'];
    stockType = json['stock_type'];
    clicks = json['clicks'];
    state = json['state'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['company_id'] = this.companyId;
    data['barcode'] = this.barcode;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image_path'] = this.imagePath;
    data['description'] = this.description;
    data['unit'] = this.unit;
    data['unit_type'] = this.unitType;
    data['purchase_price'] = this.purchasePrice;
    data['sale_price'] = this.salePrice;
    data['discount'] = this.discount;
    data['stock'] = this.stock;
    data['stock_type'] = this.stockType;
    data['clicks'] = this.clicks;
    data['state'] = this.state;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
