import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 CustomTextField({Key? key, required this.hintText,this.onChanged }) : super(key: key);
  final String hintText;
 Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return 'field is required ';
        }
      },
      onChanged:onChanged,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          )
      ),
    );
  }
}
