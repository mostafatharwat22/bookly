import 'package:bookly_app/feature/register/presention/views/widget/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: RegisterViewBody(),
    );
  }
}
