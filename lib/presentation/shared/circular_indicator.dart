
import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator() , 
            SizedBox(height: 10) , 
            Text("Checking...")
          ],
        ),
      ),
    );
  }
}