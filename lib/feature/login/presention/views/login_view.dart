import 'package:bookly_app/feature/login/presention/views/widget/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LoginViewBody(),
    );
  }
}
