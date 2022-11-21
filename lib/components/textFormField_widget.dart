import 'package:flutter/material.dart';

class BuildFuelTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String label;
  final String validator;

  const BuildFuelTextField({
    required this.controller,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8.0, 20.0, 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          prefix: const Text('R\$ '),
          labelText: label,
          border: const OutlineInputBorder(),

          //labelStyle: TextStyle(color: Colors.grey),
        ),
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 16,
        ),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validator;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
