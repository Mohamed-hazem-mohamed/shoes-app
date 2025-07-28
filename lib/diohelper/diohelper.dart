import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://dummyjson.com/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final res = await dio.post(
        "auth/login",
        data: {
          "username": username,
          "password": password,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print(" Status Code: ${res.statusCode}");
      print(" Response Data: ${res.data}");

      if (res.statusCode == 200 && res.data['accessToken'] != null) {
        final accessToken = res.data['accessToken'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', accessToken);
        print(" Token saved: $accessToken");
      } else {
        throw Exception("Login failed. Invalid credentials.");
      }
    } catch (e) {
      if (e is DioException) {
        print("❌ DioException: ${e.response?.data}");
        throw Exception(e.response?.data['message'] ?? 'Login failed.');
      } else {
        print("❌ Unknown Error: $e");
        throw Exception("Login failed due to unknown error.");
      }
    }
  }
}
