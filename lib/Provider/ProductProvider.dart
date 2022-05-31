import 'package:flutter/material.dart';
import 'package:toyshop/Models/CategoryModel.dart';
import 'package:toyshop/Models/ProductDetailModel.dart';
import 'package:toyshop/Models/ProductListingModel.dart';
import 'package:toyshop/Models/SubCategoryModel.dart';

class ProductProvider extends ChangeNotifier{
  bool _loader;

  CategoryResponseModel _categoryResponseModel;
  SubCategoryResponseModel  _subCategoryResponseModel;
  ProductListingModel  _productListingModel;
  ProductDetailResponse _productDetailResponse;

  CategoryResponseModel get categoryResponseModel => _categoryResponseModel;

  set setCategoryResponseModel(CategoryResponseModel value) {
    _categoryResponseModel = value;
    notifyListeners();
  }


  ProductDetailResponse get productDetailResponse => _productDetailResponse;

  set setProductDetailResponse(ProductDetailResponse value) {
    _productDetailResponse = value;
    notifyListeners();
  }

  ProductListingModel get productListingModel => _productListingModel;

  set setProductListingModel(ProductListingModel value) {
    _productListingModel = value;
    notifyListeners();
  }

  SubCategoryResponseModel get subCategoryResponseModel =>
      _subCategoryResponseModel;

  set setSubCategoryResponseModel(SubCategoryResponseModel value) {
    _subCategoryResponseModel = value;
    notifyListeners();
  }

  bool get loader => _loader;

  set setLoader(bool value) {
    _loader = value;
    notifyListeners();
  }
}