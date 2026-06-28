import 'package:flutter/material.dart';
import 'package:weather_app_2/models/weather_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(weatherModel.countryImageUrl, height: 60),
            SizedBox(width: 16),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(weatherModel.name),
                Text(weatherModel.tempreature),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
