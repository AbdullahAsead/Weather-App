import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2/controllers/my_provider.dart';
import 'package:weather_app_2/models/auth_model.dart';
import 'package:weather_app_2/views/screens/home_screen.dart';
import 'package:weather_app_2/views/screens/register_screen.dart';
import 'package:weather_app_2/views/widgets/custom_button.dart';
import 'package:weather_app_2/views/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextFormField(
                    controller: emailController,
                    hText: 'Email',
                    pIcon: Icon(Icons.email),
                    isEmail: true,
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    controller: passController,
                    hText: 'Password',
                    pIcon: Icon(Icons.lock),
                  ),

                  SizedBox(height: 20),
                  CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final result = await context.read<MyProvider>().login(
                          AuthRequest(
                            email: emailController.text,
                            password: passController.text,
                          ),
                        );
                        if (result) {
                          context.read<MyProvider>().getWeather();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeScreen();
                              },
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('SomeThing Went Wrong'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      }
                    },
                    child: context.watch<MyProvider>().isLoading
                        ? CircularProgressIndicator()
                        : Text('Login'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterScreen();
                              },
                            ),
                          );
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
