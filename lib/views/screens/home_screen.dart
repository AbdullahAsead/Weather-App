import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2/controllers/my_provider.dart';
import 'package:weather_app_2/views/screens/deatails_screen.dart';
import 'package:weather_app_2/views/widgets/custom_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Weather App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (context, MyProvider controller, _) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.errMessage != null) {
            return Center(child: Text(controller.errMessage!));
          } else {
            return ListView.builder(
              itemCount: controller.weatherList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DeatailsScreen(
                            weatherModel: controller.weatherList[index],
                          );
                        },
                      ),
                    );
                  },
                  child: CustomCard(
                    weatherModel: controller.weatherList[index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
