import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomizedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),  
    );
  }
}