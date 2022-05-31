import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toyshop/Constant/ApiEndPoints.dart';
import 'package:toyshop/Models/CategoryModel.dart';
import 'package:toyshop/Provider/ProductProvider.dart';
import 'package:toyshop/Services/Api/api.dart';
import 'package:toyshop/Services/Api/api_exception.dart';
import 'package:toyshop/Services/Api/api_response.dart';

class CategoryService {
  Future<ApiResponse<CategoryResponseModel>> getCategory(
      BuildContext context) async {
    var productProvider = Provider.of<ProductProvider>(context, listen: false);
    try {
      productProvider.setLoader = true;

      var response = await Api.getRequestData(ApiEndPoints.categories, context);

      print(response.toString());

      CategoryResponseModel responseModel = CategoryResponseModel.fromJsonList(response);

      productProvider.setCategoryResponseModel = responseModel;

      productProvider.setLoader = false;

      return ApiResponse.completed(responseModel);
    } on BadRequestException {
      return ApiResponse.error('Bad Request Exception');
    } on UnauthorisedException {
      return ApiResponse.error('The User is Un-authorized');
    } on RequestNotFoundException {
      return ApiResponse.error('Request Not Found');
    } on UnautorizationException {
      return ApiResponse.error('The User is Un-authorized');
    } on InternalServerException {
      return ApiResponse.error('Internal Server Error');
    } on ServerNotFoundException {
      return ApiResponse.error('Server Not Available');
    } on FetchDataException {
      return ApiResponse.error('An Error occurred while Fetching the Data');
    } catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}
