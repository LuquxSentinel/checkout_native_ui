import 'dart:convert';

import 'package:checkout/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

class UserService {
  final Dio dio = Dio();
  static const String baseUrl = "http://20.20.20.70:4000";
  Future<LoginResponse> login(
      {required String email, required String password}) async {
    try {
      print('---------------------------login api call');
      Response response = await dio
          .post("$baseUrl/login", data: {"email": email, "password": password});

      if (response.statusCode! == 200) {
        Map<String, dynamic> data = jsonDecode(response.data);
        print(data);
        String token = response.headers.value('authorization')!;
        print(token);
        return LoginResponse(data['email'], token);
      } else {
        throw UnauthorizedException(response.data['error']);
      }
    } catch (error) {
      rethrow;
    }
  }
}

class LoginResponse {
  final String email;
  final String token;

  LoginResponse(this.email, this.token);
}
