import 'package:bookly_app/core/utilles/styles.dart';
import 'package:bookly_app/feature/register/presention/views/register_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utilles/app_router.dart';
import '../../../../../core/utilles/assets.dart';
import 'custom_elveted_bottom.dart';
import 'custom_text_form.dart';

class LoginViewBody extends StatelessWidget {
   LoginViewBody({Key? key}) : super(key: key);
  GlobalKey<FormState> keyForm = GlobalKey();
   String ?email;
   String ?password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: keyForm,
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Image.asset(AssetsData.loginImage,),
            const SizedBox(height: 30,),
             CustomTextField(
               obscureText: false,
               onChanged: (data){
                 email =data;
               },
               hintText: 'Email',),
            const SizedBox(height: 20,),
             CustomTextField(
               suffixIcon: const Icon(CupertinoIcons.eye_slash),
               obscureText: true,
               onChanged: (data){
                 password =data;
               },
               hintText: 'password',),
            const SizedBox(height: 30,),
            CustomElevated(
               onTap: ()async{
                 if (keyForm.currentState!.validate()) {
                   try {
                     var auth= FirebaseAuth.instance;
                     UserCredential user=await auth.
                     signInWithEmailAndPassword(
                       email: email!,
                       password: password!,
                     );
                     ScaffoldMessenger.of(context).
                     showSnackBar(const SnackBar(content:Text(
                         'success'
                     ) ));
                     GoRouter.of(context).push(AppRouter.kHomeView);
                   } on FirebaseAuthException catch (e) {
                     if (e.code == 'weak-password') {
                       ScaffoldMessenger.of(context).
                       showSnackBar(const SnackBar(content:Text(
                           'weak password'
                       ) ));
                     } else if (e.code == 'email-already-in-use') {
                       ScaffoldMessenger.of(context).
                       showSnackBar(const SnackBar(content:Text(
                           'email-already-in-use'
                       ) ));
                     }
                   }
                 }
               },
               text: 'Sign in',),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('don,t have an account ?', style: Styles.textStyle16,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const RegisterView();
                    },));
                  },
                    child: const Text('Sign up',style: TextStyle(fontSize: 16,color: Colors.purpleAccent))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
