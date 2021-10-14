import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:xenshop/constants/api_paths_constants.dart';
import 'package:xenshop/utils/services/shared_preference/shared_preference.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'custom_exception.dart';

class ApiProvider{
  final String _baseUrl = baseUrl;
  final SharedPreference _sharedPref = SharedPreference();

  Map<String, String> requestHeaders = {
    'Accept-Charset': 'utf-8'
  };

  Future<dynamic> get({required String url}) async {
    dynamic responseJson;
    try {
      debugPrint(_baseUrl+ url);
      final response = await http.get(Uri.parse(_baseUrl + url), headers: requestHeaders);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post({required String url, required Map<String,dynamic> body, bool sendToken = true}) async {
    debugPrint(_baseUrl+ url);

    if(sendToken){
      //var token = await _getApiToken();
      var map = <String, String>{};
      //print(token);
      //map[TOKEN_KEY] = token;
      requestHeaders.addAll(map);
    }
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url),headers: requestHeaders,body: body);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postWithObject(String url, Map<String, String> header, Object body) async {
    requestHeaders.addAll(header);
    debugPrint(_baseUrl+ url);
    dynamic responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url),headers: requestHeaders,body: json.encode(body));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, Map<String, String> header, Map<String,dynamic> body) async {
    requestHeaders.addAll(header);
    debugPrint(_baseUrl+ url);
    dynamic responseJson;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url),headers: requestHeaders,body: json.encode(body));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> patch(String url, Map<String, String> header, Map<String,dynamic> body) async {
    requestHeaders.addAll(header);
    debugPrint(_baseUrl+ url);
    dynamic responseJson;
    try {
      final response = await http.patch(Uri.parse(_baseUrl + url),headers: requestHeaders,body: json.encode(body));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
      case 204:
        if(response.body.isNotEmpty){
          var responseJson = json.decode(response.body.toString());
          debugPrint(responseJson);
          return responseJson;
        }else{
          var responseJson = 'success';
          debugPrint(responseJson);
          return responseJson;
        }
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        return response.statusCode;
    // throw UnauthorisedException(response.statusCode);
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  /*Future<String> _getApiToken() async {
    try {
      var userMap = await _sharedPref.read(SHARED_PREF_USER);
      return User.fromJson(userMap).appApiToken!;
    } on Exception {
      return '';
    }
  }*/
}