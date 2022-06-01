// class ProductDetailResponse {
//   int id;
//   String slug;
//   int userId;
//   Name name;
//   Name description;
//   int price;
//   int discountPrice;
//   int quantity;
//   String productType;
//   int discountPer;
//   int catId;
//   int isFeatured;
//   int subCatId;
//   dynamic expiryDate;
//   int sold;
//   int averageRating;
//   int parentId;
//   int minPrice;
//   int maxPrice;
//   String image;
//   int active;
//   String defaultImage;
//   Supplier supplier;
//   List<Images> images;
//   List<Category> category;
//
//   ProductDetailResponse(
//       {this.id,
//       this.slug,
//       this.userId,
//       this.name,
//       this.description,
//       this.price,
//       this.discountPrice,
//       this.quantity,
//       this.productType,
//       this.discountPer,
//       this.catId,
//       this.isFeatured,
//       this.subCatId,
//       this.expiryDate,
//       this.sold,
//       this.averageRating,
//       this.parentId,
//       this.minPrice,
//       this.maxPrice,
//       this.image,
//       this.active,
//       this.defaultImage,
//       this.supplier,
//       this.images,
//       this.category});
//
//   ProductDetailResponse.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     slug = json['slug'];
//     userId = json['user_id'];
//     name = json['name'] != null ? new Name.fromJson(json['name']) : null;
//     description = json['description'] != null
//         ? new Name.fromJson(json['description'])
//         : null;
//     price = json['price'];
//     discountPrice = json['discount_price'];
//     quantity = json['quantity'];
//     productType = json['product_type'];
//     discountPer = json['discount_per'];
//     catId = json['cat_id'];
//     isFeatured = json['is_featured'];
//     subCatId = json['sub_cat_id'];
//     expiryDate = json['expiry_date'];
//     sold = json['sold'];
//     averageRating = json['average_rating'];
//     parentId = json['parent_id'];
//     minPrice = json['min_price'];
//     maxPrice = json['max_price'];
//     image = json['image'];
//     active = json['active'];
//     defaultImage = json['default_image'];
//     supplier = json['supplier'] != null
//         ? new Supplier.fromJson(json['supplier'])
//         : null;
//     if (json['images'] != null) {
//       images = <Images>[];
//       json['images'].forEach((v) {
//         images.add(new Images.fromJson(v));
//       });
//     }
//     if (json['category'] != null) {
//       category = <Category>[];
//       json['category'].forEach((v) {
//         category.add(new Category.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['slug'] = this.slug;
//     data['user_id'] = this.userId;
//     if (this.name != null) {
//       data['name'] = this.name.toJson();
//     }
//     if (this.description != null) {
//       data['description'] = this.description.toJson();
//     }
//     data['price'] = this.price;
//     data['discount_price'] = this.discountPrice;
//     data['quantity'] = this.quantity;
//     data['product_type'] = this.productType;
//     data['discount_per'] = this.discountPer;
//     data['cat_id'] = this.catId;
//     data['is_featured'] = this.isFeatured;
//     data['sub_cat_id'] = this.subCatId;
//     data['expiry_date'] = this.expiryDate;
//     data['sold'] = this.sold;
//     data['average_rating'] = this.averageRating;
//     data['parent_id'] = this.parentId;
//     data['min_price'] = this.minPrice;
//     data['max_price'] = this.maxPrice;
//     data['image'] = this.image;
//     data['active'] = this.active;
//     data['default_image'] = this.defaultImage;
//     if (this.supplier != null) {
//       data['supplier'] = this.supplier.toJson();
//     }
//     if (this.images != null) {
//       data['images'] = this.images.map((v) => v.toJson()).toList();
//     }
//     if (this.category != null) {
//       data['category'] = this.category.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Name {
//   String en;
//   String ar;
//
//   Name({this.en, this.ar});
//
//   Name.fromJson(Map<String, dynamic> json) {
//     en = json['en'];
//     ar = json['ar'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['en'] = this.en;
//     data['ar'] = this.ar;
//     return data;
//   }
// }
//
// class Supplier {
//   int id;
//   int cityId;
//   int expiryDate;
//   String userName;
//   Name name;
//   String email;
//   String phone;
//   String image;
//   String logo;
//   String tradeLicense;
//   Null drivingLicense;
//   bool isVerified;
//   bool isActive;
//   String verificationCode;
//   String address;
//   double latitude;
//   double longitude;
//   String userType;
//   int parentId;
//   int supplierId;
//   Name about;
//   int rating;
//   int clientId;
//   int secretId;
//   Null amountOnHold;
//   Null availableBalance;
//   int totalEarning;
//   int settings;
//   Null fcmToken;
//   Null facebookId;
//   int googleId;
//   Null coupon;
//   String createdAt;
//   String updatedAt;
//   Null deletedAt;
//   String drivingLicenseUrl;
//   String imageUrl;
//   Null idCardImagesUrl;
//
//   Supplier(
//       {this.id,
//       this.cityId,
//       this.expiryDate,
//       this.userName,
//       this.name,
//       this.email,
//       this.phone,
//       this.image,
//       this.logo,
//       this.tradeLicense,
//       this.drivingLicense,
//       this.isVerified,
//       this.isActive,
//       this.verificationCode,
//       this.address,
//       this.latitude,
//       this.longitude,
//       this.userType,
//       this.parentId,
//       this.supplierId,
//       this.about,
//       this.rating,
//       this.clientId,
//       this.secretId,
//       this.amountOnHold,
//       this.availableBalance,
//       this.totalEarning,
//       this.settings,
//       this.fcmToken,
//       this.facebookId,
//       this.googleId,
//       this.coupon,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.drivingLicenseUrl,
//       this.imageUrl,
//       this.idCardImagesUrl});
//
//   Supplier.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     cityId = json['city_id'];
//     expiryDate = json['expiry_date'];
//     userName = json['user_name'];
//     name = json['name'] != null ? new Name.fromJson(json['name']) : null;
//     email = json['email'];
//     phone = json['phone'];
//     image = json['image'];
//     logo = json['logo'];
//     tradeLicense = json['trade_license'];
//     drivingLicense = json['driving_license'];
//     isVerified = json['is_verified'];
//     isActive = json['is_active'];
//     verificationCode = json['verification_code'];
//     address = json['address'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     userType = json['user_type'];
//     parentId = json['parent_id'];
//     supplierId = json['supplier_id'];
//     about = json['about'] != null ? new Name.fromJson(json['about']) : null;
//     rating = json['rating'];
//     clientId = json['client_id'];
//     secretId = json['secret_id'];
//     amountOnHold = json['amount_on_hold'];
//     availableBalance = json['available_balance'];
//     totalEarning = json['total_earning'];
//     settings = json['settings'];
//     fcmToken = json['fcm_token'];
//     facebookId = json['facebook_id'];
//     googleId = json['google_id'];
//     coupon = json['coupon'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     drivingLicenseUrl = json['driving_license_url'];
//     imageUrl = json['image_url'];
//     idCardImagesUrl = json['id_card_images_url'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['city_id'] = this.cityId;
//     data['expiry_date'] = this.expiryDate;
//     data['user_name'] = this.userName;
//     if (this.name != null) {
//       data['name'] = this.name.toJson();
//     }
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['image'] = this.image;
//     data['logo'] = this.logo;
//     data['trade_license'] = this.tradeLicense;
//     data['driving_license'] = this.drivingLicense;
//     data['is_verified'] = this.isVerified;
//     data['is_active'] = this.isActive;
//     data['verification_code'] = this.verificationCode;
//     data['address'] = this.address;
//     data['latitude'] = this.latitude;
//     data['longitude'] = this.longitude;
//     data['user_type'] = this.userType;
//     data['parent_id'] = this.parentId;
//     data['supplier_id'] = this.supplierId;
//     if (this.about != null) {
//       data['about'] = this.about.toJson();
//     }
//     data['rating'] = this.rating;
//     data['client_id'] = this.clientId;
//     data['secret_id'] = this.secretId;
//     data['amount_on_hold'] = this.amountOnHold;
//     data['available_balance'] = this.availableBalance;
//     data['total_earning'] = this.totalEarning;
//     data['settings'] = this.settings;
//     data['fcm_token'] = this.fcmToken;
//     data['facebook_id'] = this.facebookId;
//     data['google_id'] = this.googleId;
//     data['coupon'] = this.coupon;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['deleted_at'] = this.deletedAt;
//     data['driving_license_url'] = this.drivingLicenseUrl;
//     data['image_url'] = this.imageUrl;
//     data['id_card_images_url'] = this.idCardImagesUrl;
//     return data;
//   }
// }
//
// class Images {
//   int id;
//   int productId;
//   String filePath;
//   int fileDefault;
//   String fileType;
//
//   Images(
//       {this.id,
//       this.productId,
//       this.filePath,
//       this.fileDefault,
//       this.fileType});
//
//   Images.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     productId = json['product_id'];
//     filePath = json['file_path'];
//     fileDefault = json['file_default'];
//     fileType = json['file_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['product_id'] = this.productId;
//     data['file_path'] = this.filePath;
//     data['file_default'] = this.fileDefault;
//     data['file_type'] = this.fileType;
//     return data;
//   }
// }
//
// class Category {
//   int id;
//   Name title;
//   int parentId;
//   String image;
//   String createdAt;
//   String updatedAt;
//   Pivot pivot;
//
//   Category(
//       {this.id,
//       this.title,
//       this.parentId,
//       this.image,
//       this.createdAt,
//       this.updatedAt,
//       this.pivot});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'] != null ? new Name.fromJson(json['title']) : null;
//     parentId = json['parent_id'];
//     image = json['image'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.title != null) {
//       data['title'] = this.title.toJson();
//     }
//     data['parent_id'] = this.parentId;
//     data['image'] = this.image;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.pivot != null) {
//       data['pivot'] = this.pivot.toJson();
//     }
//     return data;
//   }
// }
//
// class Pivot {
//   int productId;
//   int categoryId;
//
//   Pivot({this.productId, this.categoryId});
//
//   Pivot.fromJson(Map<String, dynamic> json) {
//     productId = json['product_id'];
//     categoryId = json['category_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this.productId;
//     data['category_id'] = this.categoryId;
//     return data;
//   }
// }

class ProductDetailResponse {
  ProductDetailResponse({
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
    this.images,
    this.category,
  });

  int id;
  String slug;
  int userId;
  Description name;
  Description description;
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
  Supplier supplier;
  List<Images> images;
  List<Category> category;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => ProductDetailResponse(
    id: json["id"],
    slug: json["slug"],
    userId: json["user_id"],
    name: Description.fromJson(json["name"]),
    description: Description.fromJson(json["description"]),
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
    supplier: Supplier.fromJson(json["supplier"]),
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
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
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
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
  Description title;
  int parentId;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: Description.fromJson(json["title"]),
    parentId: json["parent_id"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title.toJson(),
    "parent_id": parentId,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
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

class Description {
  Description({
    this.en,
    this.ar,
  });

  String en;
  String ar;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    en: json["en"],
    ar: json["ar"],
  );

  Map<String, dynamic> toJson() => {
    "en": en,
    "ar": ar,
  };
}

class Images {
  Images({
    this.id,
    this.productId,
    this.filePath,
    this.fileDefault,
    this.fileType,
  });

  int id;
  int productId;
  String filePath;
  int fileDefault;
  String fileType;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    productId: json["product_id"],
    filePath: json["file_path"],
    fileDefault: json["file_default"],
    fileType: json["file_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "file_path": filePath,
    "file_default": fileDefault,
    "file_type": fileType,
  };
}

class Supplier {
  Supplier({
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
  Description name;
  String email;
  String phone;
  String image;
  dynamic logo;
  String tradeLicense;
  dynamic drivingLicense;
  bool isVerified;
  bool isActive;
  String verificationCode;
  String address;
  double latitude;
  double longitude;
  String userType;
  int parentId;
  dynamic supplierId;
  Description about;
  int rating;
  dynamic clientId;
  dynamic secretId;
  dynamic amountOnHold;
  dynamic availableBalance;
  dynamic totalEarning;
  int settings;
  dynamic fcmToken;
  dynamic facebookId;
  dynamic googleId;
  dynamic coupon;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String drivingLicenseUrl;
  String imageUrl;
  dynamic idCardImagesUrl;

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
    id: json["id"],
    cityId: json["city_id"],
    expiryDate: json["expiry_date"],
    userName: json["user_name"],
    name: Description.fromJson(json["name"]),
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    logo: json["logo"],
    tradeLicense: json["trade_license"],
    drivingLicense: json["driving_license"],
    isVerified: json["is_verified"],
    isActive: json["is_active"],
    verificationCode: json["verification_code"],
    address: json["address"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    userType: json["user_type"],
    parentId: json["parent_id"],
    supplierId: json["supplier_id"],
    about: Description.fromJson(json["about"]),
    rating: json["rating"],
    clientId: json["client_id"],
    secretId: json["secret_id"],
    amountOnHold: json["amount_on_hold"],
    availableBalance: json["available_balance"],
    totalEarning: json["total_earning"],
    settings: json["settings"],
    fcmToken: json["fcm_token"],
    facebookId: json["facebook_id"],
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
    "expiry_date": expiryDate,
    "user_name": userName,
    "name": name.toJson(),
    "email": email,
    "phone": phone,
    "image": image,
    "logo": logo,
    "trade_license": tradeLicense,
    "driving_license": drivingLicense,
    "is_verified": isVerified,
    "is_active": isActive,
    "verification_code": verificationCode,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "user_type": userType,
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
    "fcm_token": fcmToken,
    "facebook_id": facebookId,
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
