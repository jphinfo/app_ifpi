import 'package:flutter/material.dart';

class TextFormFieldWiget extends StatelessWidget {
  const TextFormFieldWiget({
    required this.controller,
    required this.textInputAction,
    this.keyboardType = TextInputType.text,
    required this.label,
    required this.hintText,
    this.prefix = '',
    required this.validator,
    Key? key,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String label;
  final String hintText;
  final String prefix;
  final String validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          hintText: hintText,
          prefix: Text(prefix),
          hintStyle: const TextStyle(color: Color.fromARGB(141, 58, 115, 52)),
          labelText: label,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 4.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((10.0)),
            borderSide: const BorderSide(
              color: Color.fromARGB(76, 76, 175, 79),
              width: 3.0,
            ),
          ),
        ),
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.green[600],
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
