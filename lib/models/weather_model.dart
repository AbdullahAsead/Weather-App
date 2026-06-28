class WeatherModel {
  final num id;
  final String name;
  final String tempreature;
  final String weatherImageUrl;
  final String countryImageUrl;
  final String weatherCondition;

  WeatherModel({
    required this.id,
    required this.name,
    required this.tempreature,
    required this.weatherImageUrl,
    required this.countryImageUrl,
    required this.weatherCondition,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    return WeatherModel(
      id: data['id'],
      name: data['name'],
      tempreature: data['tempreature'],
      weatherImageUrl: data['weatherImageUrl'],
      countryImageUrl: data['countryImageUrl'],
      weatherCondition: data['weatherCondition'],
    );
  }
}

class WeatherResponse {
  final List<WeatherModel> country;

  WeatherResponse({required this.country});
  factory WeatherResponse.fromJson(Map<String, dynamic> data) {
    return WeatherResponse(
      country: (data['country'] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
    );
  }
}
