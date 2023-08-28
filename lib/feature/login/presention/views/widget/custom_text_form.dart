import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 CustomTextField({Key? key, required this.hintText,this.onChanged,
   required this.obscureText, this.suffixIcon,}) : super(key: key);
  final String hintText;
 Function(String)? onChanged;
 final bool  obscureText;
  Icon ?suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data){
        if(data!.isEmpty){
          return 'field is required ';
        }
      },
      onChanged:onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(color: Colors.white),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )
      ),
    );
  }
}
