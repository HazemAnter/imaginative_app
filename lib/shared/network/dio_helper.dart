import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.imaginativenews.com/api/v1/auth/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));
  }

  static Future<Response> post(String url, var body) async {
    dio.options.headers = { 'Content-Type': 'application/json',
      'Accept': 'application/json',};

    return await dio.post(
      url,
      data: body,
    );
  }
}

/*
mport 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter/Helpers/shared_helper.dart';

import 'exceptions.dart';
import 'mapper.dart';

class NetworkUtil {
  static NetworkUtil _instance;
  static const String BASE_URL = 'https://api.imaginativenews.com/api/v1/';
  static Dio _dio;
  static SharedHelper _sharedHelper;

  NetworkUtil._internal();

  factory NetworkUtil() {
    if (_instance == null) {
      _dio = Dio();
      _sharedHelper = SharedHelper();
      _instance = NetworkUtil._internal();
    }
    return _instance;
  }

  Future<dynamic> get({@required String url, bool withToken = false, Mappable model, Map query}) async {
    Response _res;
    String _token;
    try {
      if (withToken) {
        _token = await _sharedHelper.readString(CachingKey.AUTH_TOKEN);
        print('Token >>> $_token');
        _dio.options.headers = {'Authorization': 'Bearer $_token'};
      }
      _dio.options.baseUrl = BASE_URL;
      _res = await _dio.get(url, queryParameters: query);
      print('Response >>> ${_res.toString()}');
    } on DioError catch (e) {
      _res = e.response;
      print('Exception >>>  ${e.response.toString()}');
      print('Dio Exc >>> $e');
    }
    if (_res.statusCode >= 200 && _res.statusCode < 300) {
      if (model == null) {
        return _res;
      } else if (model is ListMappable) {
        return Mappable(model, _res.data);
      } else {
        return Mappable(model, _res.toString());
      }
    } else if (_res.statusCode == 404) {
      throw NotFoundException();
    } else if (_res.statusCode >= 500) {
      throw ServerException();
    } else if (_res.statusCode == 401) {
      throw UnauthenticatedException();
    } else if (_res.statusCode == 408) {
      throw TimeOutException();
    } else if (_res.statusCode == 415) {
      throw MediaTypeException();
    }
  }

  Future<List<BaseMappable>> getMultiple({@required List<String> endPoints, bool withToken = false, List<BaseMappable> models}) async {
    List<Response> _requests;
    String _token;
    try {
      if (withToken) {
        _token = await _sharedHelper.readString(CachingKey.AUTH_TOKEN);
        print('Token >>> $_token');
        _dio.options.headers = {'Authorization': 'Bearer $_token'};
      }
      _dio.options.baseUrl = BASE_URL;
      _requests = await Future.wait(endPoints.map((e) async {
        return await _dio.get(e);
      }));
    } on DioError catch (e) {
      print('Exception >>>  ${e.response.toString()}');
      print('Dio Exc >>> $e');
    }
    List<BaseMappable> _responses = [];
    for (int i = 0; i < models.length; i++) {
      _responses.add(Mappable(models[i], _requests[i].toString()));
    }
    return _responses;
  }


  Future<dynamic> post({@required String url, var body, bool withToken = false, Mappable model}) async {
    Response _res;
    String _token;
    _dio.options.baseUrl = BASE_URL;
    try {
      if (withToken) {
        _token = await _sharedHelper.readString(CachingKey.AUTH_TOKEN);
        print('Token >>> $_token');
        _dio.options.headers = {
          'Authorization': 'Bearer $_token',
          "Accept": "application/json",
        };
      }
      _res = await _dio.post(url, data: body);
      print('Correct request >>> ${_res.toString()}');
    } on DioError catch (e) {
      _res = e.response;
      print('Exception >>>  ${e.response.toString()}');
      print('Dio Exc >>> $e');
      if(model == null){
        return _res;
      }else{
        return Mappable(model, _res) ;
      }
    }
    print('Code >>> ${_res.statusCode}');
    if (_res.statusCode >= 200 && _res.statusCode < 300) {
      if (model == null) {
        return _res;
      } else if (model is ListMappable) {
        return Mappable(model, _res.data);
      } else {
        return Mappable(mod…*/
