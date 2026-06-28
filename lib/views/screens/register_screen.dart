import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_2/controllers/my_provider.dart';
import 'package:weather_app_2/models/auth_model.dart';
import 'package:weather_app_2/views/screens/login_screen.dart';
import 'package:weather_app_2/views/widgets/custom_button.dart';
import 'package:weather_app_2/views/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'), centerTitle: true),
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
                    controller: nameController,
                    hText: 'Name',
                    pIcon: Icon(Icons.person),
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    controller: phoneController,
                    hText: 'Phone',
                    pIcon: Icon(Icons.phone),
                  ),
                  SizedBox(height: 16),
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
                        final result = await context
                            .read<MyProvider>()
                            .register(
                              AuthRequest(
                                email: emailController.text,
                                password: passController.text,
                                name: nameController.text,
                                phoneNumber: phoneController.text,
                              ),
                            );
                        if (result) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
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
                        : Text('Sign Up'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                        child: Text('Login '),
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
