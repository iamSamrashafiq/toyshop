class ProductListingModel {
  ProductListingModel({
    this.success,
    this.message,
    this.data,
    this.errors,
    this.status,
  });

  bool success;
  String message;
  Data data;
  Errors errors;
  int status;

  factory ProductListingModel.fromJson(Map<String, dynamic> json) => ProductListingModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    errors: Errors.fromJson(json["errors"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data.toJson(),
    "errors": errors.toJson(),
    "status": status,
  };
}

class Data {
  Data({
    this.collection,
    this.pagination,
  });

  Collection collection;
  Errors pagination;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    collection: Collection.fromJson(json["collection"]),
    pagination: Errors.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "collection": collection.toJson(),
    "pagination": pagination.toJson(),
  };
}

class Collection {
  Collection({
    this.products,
    this.categories,
    this.suppliers,
  });

  Products products;
  List<Category> categories;
  Suppliers suppliers;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    products: Products.fromJson(json["products"]),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    suppliers: Suppliers.fromJson(json["suppliers"]),
  );

  Map<String, dynamic> toJson() => {
    "products": products.toJson(),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "suppliers": suppliers.toJson(),
  };
}

class Category {
  Category({
    this.id,
    this.title,
    this.parentId,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int id;
  Title title;
  int parentId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: Title.fromJson(json["title"]),
    parentId: json["parent_id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title.toJson(),
    "parent_id": parentId,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot == null ? null : pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    this.productId,
    this.categoryId,
  });

  int productId;
  int categoryId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    productId: json["product_id"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "category_id": categoryId,
  };
}

class Title {
  Title({
    this.en,
    this.ar,
  });

  String en;
  String ar;

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "ar": ar,
  };
}

class Products {
  Products({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<ProductsDatum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    currentPage: json["current_page"],
    data: List<ProductsDatum>.from(json["data"].map((x) => ProductsDatum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class ProductsDatum {
  ProductsDatum({
    this.id,
    this.slug,
    this.userId,
    this.name,
    this.description,
    this.price,
    this.discountPrice,
    this.quantity,
    this.productType,
    this.discountPer,
    this.catId,
    this.isFeatured,
    this.subCatId,
    this.expiryDate,
    this.sold,
    this.averageRating,
    this.parentId,
    this.minPrice,
    this.maxPrice,
    this.image,
    this.active,
    this.defaultImage,
    this.supplier,
    this.category,
  });

  int id;
  String slug;
  int userId;
  Title name;
  Title description;
  int price;
  int discountPrice;
  int quantity;
  String productType;
  int discountPer;
  int catId;
  int isFeatured;
  int subCatId;
  dynamic expiryDate;
  int sold;
  int averageRating;
  int parentId;
  dynamic minPrice;
  dynamic maxPrice;
  dynamic image;
  int active;
  String defaultImage;
  SupplierElement supplier;
  List<Category> category;

  factory ProductsDatum.fromJson(Map<String, dynamic> json) => ProductsDatum(
    id: json["id"],
    slug: json["slug"],
    userId: json["user_id"],
    name: Title.fromJson(json["name"]),
    description: Title.fromJson(json["description"]),
    price: json["price"],
    discountPrice: json["discount_price"],
    quantity: json["quantity"],
    productType: json["product_type"],
    discountPer: json["discount_per"],
    catId: json["cat_id"],
    isFeatured: json["is_featured"],
    subCatId: json["sub_cat_id"],
    expiryDate: json["expiry_date"],
    sold: json["sold"],
    averageRating: json["average_rating"],
    parentId: json["parent_id"],
    minPrice: json["min_price"],
    maxPrice: json["max_price"],
    image: json["image"],
    active: json["active"],
    defaultImage: json["default_image"],
    supplier: SupplierElement.fromJson(json["supplier"]),
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "user_id": userId,
    "name": name.toJson(),
    "description": description.toJson(),
    "price": price,
    "discount_price": discountPrice,
    "quantity": quantity,
    "product_type": productType,
    "discount_per": discountPer,
    "cat_id": catId,
    "is_featured": isFeatured,
    "sub_cat_id": subCatId,
    "expiry_date": expiryDate,
    "sold": sold,
    "average_rating": averageRating,
    "parent_id": parentId,
    "min_price": minPrice,
    "max_price": maxPrice,
    "image": image,
    "active": active,
    "default_image": defaultImage,
    "supplier": supplier.toJson(),
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
  };
}

class SupplierElement {
  SupplierElement({
    this.id,
    this.cityId,
    this.expiryDate,
    this.userName,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.logo,
    this.tradeLicense,
    this.drivingLicense,
    this.isVerified,
    this.isActive,
    this.verificationCode,
    this.address,
    this.latitude,
    this.longitude,
    this.userType,
    this.parentId,
    this.supplierId,
    this.about,
    this.rating,
    this.clientId,
    this.secretId,
    this.amountOnHold,
    this.availableBalance,
    this.totalEarning,
    this.settings,
    this.fcmToken,
    this.facebookId,
    this.googleId,
    this.coupon,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.drivingLicenseUrl,
    this.imageUrl,
    this.idCardImagesUrl,
  });

  int id;
  int cityId;
  int expiryDate;
  dynamic userName;
  Title name;
  String email;
  String phone;
  String image;
  String logo;
  String tradeLicense;
  dynamic drivingLicense;
  bool isVerified;
  bool isActive;
  String verificationCode;
  String address;
  double latitude;
  double longitude;
  UserType userType;
  int parentId;
  dynamic supplierId;
  Title about;
  int rating;
  dynamic clientId;
  dynamic secretId;
  dynamic amountOnHold;
  dynamic availableBalance;
  dynamic totalEarning;
  int settings;
  String fcmToken;
  String facebookId;
  dynamic googleId;
  dynamic coupon;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String drivingLicenseUrl;
  String imageUrl;
  dynamic idCardImagesUrl;

  factory SupplierElement.fromJson(Map<String, dynamic> json) => SupplierElement(
    id: json["id"],
    cityId: json["city_id"],
    expiryDate: json["expiry_date"] == null ? null : json["expiry_date"],
    userName: json["user_name"],
    name: Title.fromJson(json["name"]),
    email: json["email"],
    phone: json["phone"],
    image: json["image"] == null ? null : json["image"],
    logo: json["logo"] == null ? null : json["logo"],
    tradeLicense: json["trade_license"] == null ? null : json["trade_license"],
    drivingLicense: json["driving_license"],
    isVerified: json["is_verified"],
    isActive: json["is_active"],
    verificationCode: json["verification_code"],
    address: json["address"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    userType: userTypeValues.map[json["user_type"]],
    parentId: json["parent_id"],
    supplierId: json["supplier_id"],
    about: Title.fromJson(json["about"]),
    rating: json["rating"],
    clientId: json["client_id"],
    secretId: json["secret_id"],
    amountOnHold: json["amount_on_hold"],
    availableBalance: json["available_balance"],
    totalEarning: json["total_earning"],
    settings: json["settings"],
    fcmToken: json["fcm_token"] == null ? null : json["fcm_token"],
    facebookId: json["facebook_id"] == null ? null : json["facebook_id"],
    googleId: json["google_id"],
    coupon: json["coupon"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    drivingLicenseUrl: json["driving_license_url"],
    imageUrl: json["image_url"],
    idCardImagesUrl: json["id_card_images_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "city_id": cityId,
    "expiry_date": expiryDate == null ? null : expiryDate,
    "user_name": userName,
    "name": name.toJson(),
    "email": email,
    "phone": phone,
    "image": image == null ? null : image,
    "logo": logo == null ? null : logo,
    "trade_license": tradeLicense == null ? null : tradeLicense,
    "driving_license": drivingLicense,
    "is_verified": isVerified,
    "is_active": isActive,
    "verification_code": verificationCode,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "user_type": userTypeValues.reverse[userType],
    "parent_id": parentId,
    "supplier_id": supplierId,
    "about": about.toJson(),
    "rating": rating,
    "client_id": clientId,
    "secret_id": secretId,
    "amount_on_hold": amountOnHold,
    "available_balance": availableBalance,
    "total_earning": totalEarning,
    "settings": settings,
    "fcm_token": fcmToken == null ? null : fcmToken,
    "facebook_id": facebookId == null ? null : facebookId,
    "google_id": googleId,
    "coupon": coupon,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "deleted_at": deletedAt,
    "driving_license_url": drivingLicenseUrl,
    "image_url": imageUrl,
    "id_card_images_url": idCardImagesUrl,
  };
}

enum UserType { SUPPLIER }

final userTypeValues = EnumValues({
  "supplier": UserType.SUPPLIER
});

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

class Suppliers {
  Suppliers({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<SupplierElement> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Suppliers.fromJson(Map<String, dynamic> json) => Suppliers(
    currentPage: json["current_page"],
    data: List<SupplierElement>.from(json["data"].map((x) => SupplierElement.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Errors {
  Errors();

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
  );

  Map<String, dynamic> toJson() => {
  };
}

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
