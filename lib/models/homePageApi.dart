class HomePageApi {
  List<Categories> categories;
  List<Slides> slides;
  List<Products> products;
  List<Pictures> pictures;
  List<Companies> companies;

  HomePageApi(
      {this.categories,
      this.slides,
      this.products,
      this.pictures,
      this.companies});

  HomePageApi.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    if (json['slides'] != null) {
      slides = new List<Slides>();
      json['slides'].forEach((v) {
        slides.add(new Slides.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
    if (json['pictures'] != null) {
      pictures = new List<Pictures>();
      json['pictures'].forEach((v) {
        pictures.add(new Pictures.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = new List<Companies>();
      json['companies'].forEach((v) {
        companies.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    if (this.slides != null) {
      data['slides'] = this.slides.map((v) => v.toJson()).toList();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    if (this.pictures != null) {
      data['pictures'] = this.pictures.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int id;
  String name;
  String slug;
  String kdv;
  String logoPhotoPath;
  String state;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  Categories(
      {this.id,
      this.name,
      this.slug,
      this.kdv,
      this.logoPhotoPath,
      this.state,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    kdv = json['kdv'];
    logoPhotoPath = json['logo_photo_path'];
    state = json['state'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['kdv'] = this.kdv;
    data['logo_photo_path'] = this.logoPhotoPath;
    data['state'] = this.state;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Slides {
  int id;
  String imagePath;
  String title;
  Null description;
  Null url;
  String state;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  Slides(
      {this.id,
      this.imagePath,
      this.title,
      this.description,
      this.url,
      this.state,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Slides.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    state = json['state'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
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

class Pictures {
  int id;
  String imagePath;
  String productId;
  String state;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  Pictures(
      {this.id,
      this.imagePath,
      this.productId,
      this.state,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Pictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['image_path'];
    productId = json['product_id'];
    state = json['state'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_path'] = this.imagePath;
    data['product_id'] = this.productId;
    data['state'] = this.state;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Companies {
  int id;
  String name;
  String slug;
  String logoPhotoPath;
  String type;
  String state;
  Null deletedAt;
  String createdAt;
  String updatedAt;

  Companies(
      {this.id,
      this.name,
      this.slug,
      this.logoPhotoPath,
      this.type,
      this.state,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    logoPhotoPath = json['logo_photo_path'];
    type = json['type'];
    state = json['state'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['logo_photo_path'] = this.logoPhotoPath;
    data['type'] = this.type;
    data['state'] = this.state;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
