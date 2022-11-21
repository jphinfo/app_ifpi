import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    required this.icon,
    required this.navigator,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final Function() navigator;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: navigator,
      child: Container(
        height: 100,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Colors.greenAccent,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white54,
            size: 50,
          ),
        ),
      ),
    );
  }
}
