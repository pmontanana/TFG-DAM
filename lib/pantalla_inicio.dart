import 'package:flutter/material.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Column(
          children: [
            Text("Welcome to the Home Screen"),
          ],
        ),
      ),
    );
  }
}