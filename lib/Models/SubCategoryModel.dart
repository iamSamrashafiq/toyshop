class SubCategoryResponseModel {
  List<SubCategory> allData;

  SubCategoryResponseModel({this.allData});

  SubCategoryResponseModel.fromJsonList(List<dynamic> jsonList) {
    List<SubCategory> modulesList = [];
    jsonList.forEach((element) {
      modulesList.add(SubCategory.fromJson(element));
    });
    allData = modulesList;
  }

  List<Map<String, dynamic>> toJsonList() {
    final List<Map<String, dynamic>> data = [];
    allData.forEach((element) {
      data.add(element.toJson());
    });
    return data;
  }
}

class SubCategory {
  int id;
  Title title;
  int parentId;
  String image;
  String createdAt;
  String updatedAt;

  SubCategory(
      {this.id,
        this.title,
        this.parentId,
        this.image,
        this.createdAt,
        this.updatedAt});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    parentId = json['parent_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}

class Title {
  String en;
  String ar;

  Title({this.en, this.ar});

  Title.fromJson(Map<String, dynamic> json) {
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