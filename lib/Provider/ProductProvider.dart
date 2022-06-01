import 'package:flutter/material.dart';
import 'package:toyshop/Models/CategoryModel.dart';
import 'package:toyshop/Models/ProductDetailModel.dart';
import 'package:toyshop/Models/ProductListingModel.dart';
import 'package:toyshop/Models/SubCategoryModel.dart';

class ProductProvider extends ChangeNotifier{
  int _counter = 0;
  bool _loader;
  CategoryResponseModel _categoryResponseModel;
  SubCategoryResponseModel  _subCategoryResponseModel;
  ProductListingModel  _productListingModel;
  ProductDetailResponse _productDetailResponse;


///counter
  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void incrementCounter() {
    _counter ==0 ?_counter=1 :_counter++;
    //_counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter <= 1 ? _counter = 1 : _counter--;
    notifyListeners();
  }




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