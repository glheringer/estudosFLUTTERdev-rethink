import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Function(String) onChanged;
  final String label;
  final bool obscureText;
  
  const CustomTextField(
      {Key? key, 
      required this.onChanged,
      required this.label, 
      this.obscureText = false,
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          //Configurando txt field e colocando label
          label: Text(label)),
      onChanged:  onChanged,
      obscureText: obscureText,
    );
  }
}
