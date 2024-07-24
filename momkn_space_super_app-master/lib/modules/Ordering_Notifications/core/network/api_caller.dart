import 'package:dio/dio.dart';

class ApiCaller {
  static String url = 'https://erp-backend-supply.onrender.com/';
  static BaseOptions opts = BaseOptions(
    baseUrl: url,
    connectTimeout: const Duration(seconds: 200),
    receiveTimeout: const Duration(seconds: 200),
  );
  static final dio = Dio(opts);

  static Future<Response> getHTTP(String url, [dynamic data, String? token]) async {
    late Response response;
    if (token == null && data == null) {
      response = await dio.get(url);
    } else {
      if (data != null) {
        response = await dio.get(url, data: data, options: Options(headers: {'Authorization': 'Bearer $token'}));
      } else {
        response = await dio.get(url, options: Options(headers: {'Authorization': 'Bearer $token'}));
      }
    }
    return response;
  }

  static Future<Response> postHTTP(String url, dynamic data, [String? token]) async {
    late Response response;
    if (token == null) {
      response = await dio.post(url,
          data: data,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {"Accept": "application/json"}));
    } else {
      response = await dio.post(url,
          data: data,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {"Accept": "application/json", 'Authorization': 'Bearer $token'}));
    }
    return response;
  }

  static Future<Response> putHTTP(String url, dynamic data) async {
    Response response = await dio.put(url, data: data);
    return response;
  }

  static Future<Response> patchHTTP(String url, dynamic data, [String? token]) async {
    late Response response;
    if (token == null) {
      response = await dio.patch(
        url,
        data: data,
      );
    } else {
      response = await dio.patch(url, data: data, options: Options(headers: {'Authorization': 'Bearer $token'}));
    }
    return response;
  }

  static Future<Response> deleteHTTP(String url, [String? token]) async {
    late Response response;
    if (token == null) {
      response = await dio.delete(url);
    } else {
      response = await dio.delete(url, options: Options(headers: {'Authorization': 'Bearer $token'}));
    }
    return response;
  }
}
