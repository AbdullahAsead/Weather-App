import 'package:dio/dio.dart';
import 'package:weather_app_2/constants.dart';
import 'package:weather_app_2/models/auth_model.dart';
import 'package:weather_app_2/models/weather_model.dart';

class DioService {
  final _dio = Dio();

  Future<AuthResponse?> loginUser(AuthRequest user) async {
    try {
      final result = await _dio.post(
        Constants.loginEndPoint,
        data: {"email": user.email, "password": user.password},
      );
      if (result.statusCode == 200) {
        return AuthResponse.fromJson(result.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<AuthResponse?> registerUser(AuthRequest user) async {
    try {
      final result = await _dio.post(
        Constants.registerEndPoint,
        data: {
          "email": user.email,
          "password": user.password,
          "name": user.name,
          "phoneNumber": user.phoneNumber,
        },
      );
      if (result.statusCode == 200) {
        return AuthResponse.fromJson(result.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<WeatherModel>?> getWeather() async {
    try {
      final result = await _dio.get(Constants.getEndPoint);
      if (result.statusCode == 200) {
        return WeatherResponse.fromJson(result.data).country;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
