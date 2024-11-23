import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, required this.errorMessage});
  final String errorMessage;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
