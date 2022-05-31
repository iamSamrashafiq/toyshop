import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:toyshop/Constant/ApiEndPoints.dart';
import 'api_exception.dart';
import 'package:http/http.dart' as http;

class Api {

  static Future<dynamic> getRequestData(String apiEndPoint, BuildContext context) async {
    String apiAddress = ApiEndPoints.BaseUrl + apiEndPoint;
    print("URL: " + apiAddress);
    var responseJson;
    try {
      final response = await http.get(
        Uri.parse(apiAddress),
        headers:  {
          'Content-type': 'application/json',
        },
      );
      responseJson = _returnListResponse(response);
      return responseJson;
    }on SocketException {
      print('Socket Exception');
      throw FetchDataException("No Internet Available");
    }
  }
}


dynamic _returnListResponse(http.Response response) {
  print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 404:
      throw RequestNotFoundException(response.body.toString());
    case 403:
      throw UnautorizationException(response.body.toString());
    case 500:
      throw InternalServerException(response.body.toString());
    case 503:
      throw ServerNotFoundException(response.body.toString());
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode : ${response
              .statusCode}');
  }
}