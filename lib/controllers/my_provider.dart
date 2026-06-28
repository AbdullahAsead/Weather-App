import 'package:flutter/material.dart';
import 'package:weather_app_2/models/auth_model.dart';
import 'package:weather_app_2/models/weather_model.dart';
import 'package:weather_app_2/services/dio_service.dart';

class MyProvider extends ChangeNotifier {
  final _dioService = DioService();
  bool isLoading = false;
  String? errMessage;
  List<WeatherModel> weatherList = [];

  Future<bool> login(AuthRequest user) async {
    isLoading = true;
    notifyListeners();
    final result = await _dioService.loginUser(user);
    isLoading = false;
    notifyListeners();
    return result?.statusCode ?? false;
  }

  Future<bool> register(AuthRequest user) async {
    isLoading = true;
    notifyListeners();
    final result = await _dioService.registerUser(user);
    print(result);
    isLoading = false;
    notifyListeners();
    return result?.statusCode ?? false;
  }

  Future<void> getWeather() async {
    isLoading = true;
    errMessage = null;
    notifyListeners();
    try {
      weatherList = await _dioService.getWeather() ?? [];
    } catch (e) {
      errMessage = e.toString();
      weatherList = [];
    }
    isLoading = false;
    notifyListeners();
  }
}
