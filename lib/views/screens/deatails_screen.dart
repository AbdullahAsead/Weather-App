import 'package:flutter/material.dart';
import 'package:weather_app_2/models/weather_model.dart';

class DeatailsScreen extends StatelessWidget {
  const DeatailsScreen({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(weatherModel.name, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(weatherModel.weatherImageUrl, height: 100),
                SizedBox(height: 16),
                Text(weatherModel.name),
                Text(weatherModel.tempreature),
                Text(weatherModel.weatherCondition),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
