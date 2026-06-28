import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, this.child});
  final void Function()? onPressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
