import 'package:bookly_app/core/utilles/styles.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
    CustomElevatedButton({Key? key, required this.text, this.onTap}) : super(key: key);
  final String text;
  VoidCallback ? onTap;
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[700],
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child:  Center(
          child: Text(text, style: Styles.textStyle20,),
        ),
      ),
    );
  }
}