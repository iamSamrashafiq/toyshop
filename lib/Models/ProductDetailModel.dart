class ProductDetailResponse {
  int id;
  String slug;
  int userId;
  Name name;
  Name description;
  int price;
  int discountPrice;
  int quantity;
  String productType;
  int discountPer;
  int catId;
  int isFeatured;
  int subCatId;
  Null expiryDate;
  int sold;
  int averageRating;
  int parentId;
  Null minPrice;
  Null maxPrice;
  Null image;
  int active;
  String defaultImage;
  Supplier supplier;
  List<Images> images;
  List<Category> category;

  ProductDetailResponse(
      {this.id,
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
      this.category});

  ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    userId = json['user_id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    description = json['description'] != null
        ? new Name.fromJson(json['description'])
        : null;
    price = json['price'];
    discountPrice = json['discount_price'];
    quantity = json['quantity'];
    productType = json['product_type'];
    discountPer = json['discount_per'];
    catId = json['cat_id'];
    isFeatured = json['is_featured'];
    subCatId = json['sub_cat_id'];
    expiryDate = json['expiry_date'];
    sold = json['sold'];
    averageRating = json['average_rating'];
    parentId = json['parent_id'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    image = json['image'];
    active = json['active'];
    defaultImage = json['default_image'];
    supplier = json['supplier'] != null
        ? new Supplier.fromJson(json['supplier'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['user_id'] = this.userId;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    if (this.description != null) {
      data['description'] = this.description.toJson();
    }
    data['price'] = this.price;
    data['discount_price'] = this.discountPrice;
    data['quantity'] = this.quantity;
    data['product_type'] = this.productType;
    data['discount_per'] = this.discountPer;
    data['cat_id'] = this.catId;
    data['is_featured'] = this.isFeatured;
    data['sub_cat_id'] = this.subCatId;
    data['expiry_date'] = this.expiryDate;
    data['sold'] = this.sold;
    data['average_rating'] = this.averageRating;
    data['parent_id'] = this.parentId;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    data['image'] = this.image;
    data['active'] = this.active;
    data['default_image'] = this.defaultImage;
    if (this.supplier != null) {
      data['supplier'] = this.supplier.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String en;
  String ar;

  Name({this.en, this.ar});

  Name.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class Supplier {
  int id;
  int cityId;
  int expiryDate;
  Null userName;
  Name name;
  String email;
  String phone;
  String image;
  Null logo;
  String tradeLicense;
  Null drivingLicense;
  bool isVerified;
  bool isActive;
  String verificationCode;
  String address;
  double latitude;
  double longitude;
  String userType;
  int parentId;
  Null supplierId;
  Name about;
  int rating;
  Null clientId;
  Null secretId;
  Null amountOnHold;
  Null availableBalance;
  Null totalEarning;
  int settings;
  Null fcmToken;
  Null facebookId;
  Null googleId;
  Null coupon;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String drivingLicenseUrl;
  String imageUrl;
  Null idCardImagesUrl;

  Supplier(
      {this.id,
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
      this.idCardImagesUrl});

  Supplier.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['city_id'];
    expiryDate = json['expiry_date'];
    userName = json['user_name'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    logo = json['logo'];
    tradeLicense = json['trade_license'];
    drivingLicense = json['driving_license'];
    isVerified = json['is_verified'];
    isActive = json['is_active'];
    verificationCode = json['verification_code'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userType = json['user_type'];
    parentId = json['parent_id'];
    supplierId = json['supplier_id'];
    about = json['about'] != null ? new Name.fromJson(json['about']) : null;
    rating = json['rating'];
    clientId = json['client_id'];
    secretId = json['secret_id'];
    amountOnHold = json['amount_on_hold'];
    availableBalance = json['available_balance'];
    totalEarning = json['total_earning'];
    settings = json['settings'];
    fcmToken = json['fcm_token'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    coupon = json['coupon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    drivingLicenseUrl = json['driving_license_url'];
    imageUrl = json['image_url'];
    idCardImagesUrl = json['id_card_images_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['city_id'] = this.cityId;
    data['expiry_date'] = this.expiryDate;
    data['user_name'] = this.userName;
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['logo'] = this.logo;
    data['trade_license'] = this.tradeLicense;
    data['driving_license'] = this.drivingLicense;
    data['is_verified'] = this.isVerified;
    data['is_active'] = this.isActive;
    data['verification_code'] = this.verificationCode;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['user_type'] = this.userType;
    data['parent_id'] = this.parentId;
    data['supplier_id'] = this.supplierId;
    if (this.about != null) {
      data['about'] = this.about.toJson();
    }
    data['rating'] = this.rating;
    data['client_id'] = this.clientId;
    data['secret_id'] = this.secretId;
    data['amount_on_hold'] = this.amountOnHold;
    data['available_balance'] = this.availableBalance;
    data['total_earning'] = this.totalEarning;
    data['settings'] = this.settings;
    data['fcm_token'] = this.fcmToken;
    data['facebook_id'] = this.facebookId;
    data['google_id'] = this.googleId;
    data['coupon'] = this.coupon;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['driving_license_url'] = this.drivingLicenseUrl;
    data['image_url'] = this.imageUrl;
    data['id_card_images_url'] = this.idCardImagesUrl;
    return data;
  }
}

class Images {
  int id;
  int productId;
  String filePath;
  int fileDefault;
  String fileType;

  Images(
      {this.id,
      this.productId,
      this.filePath,
      this.fileDefault,
      this.fileType});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    filePath = json['file_path'];
    fileDefault = json['file_default'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['file_path'] = this.filePath;
    data['file_default'] = this.fileDefault;
    data['file_type'] = this.fileType;
    return data;
  }
}

class Category {
  int id;
  Name title;
  int parentId;
  String image;
  String createdAt;
  String updatedAt;
  Pivot pivot;

  Category(
      {this.id,
      this.title,
      this.parentId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.pivot});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    parentId = json['parent_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    data['parent_id'] = this.parentId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot.toJson();
    }
    return data;
  }
}

class Pivot {
  int productId;
  int categoryId;

  Pivot({this.productId, this.categoryId});

  Pivot.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['category_id'] = this.categoryId;
    return data;
  }
}
