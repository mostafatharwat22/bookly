import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utilles/assets.dart';
import '../../../../../core/utilles/styles.dart';
import '../../../../login/presention/views/widget/custom_elveted_bottom.dart';
import '../../../../login/presention/views/widget/custom_text_form.dart';

class RegisterViewBody extends StatelessWidget {
   RegisterViewBody({Key? key,}) : super(key: key);
String ?email;
String ?password;
GlobalKey<FormState> keyForm = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key:keyForm,
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Image.asset(AssetsData.loginImage,),
            const SizedBox(height: 30,),
             CustomTextField(
               obscureText: false,
               onChanged:(data){
                 email= data;
               } ,
               hintText: 'Email',),
            const SizedBox(height: 20,),
             CustomTextField(
               suffixIcon: const Icon(CupertinoIcons.eye_slash),
               obscureText: true,
              onChanged:(data){
                password= data;
              } ,
              hintText: 'password',),
            const SizedBox(height: 30,),
            CustomElevated(
               onTap: ()async{
                 if (keyForm.currentState!.validate()) {
                   try {
                     var auth= FirebaseAuth.instance;
                                 UserCredential user=await auth.
                     createUserWithEmailAndPassword(
                         email: email!,
                         password: password!,
                     );
                     ScaffoldMessenger.of(context).
                     showSnackBar(const SnackBar(content:Text(
                         'success'
                     ) ));
                     Navigator.pop(context);
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
               text: 'Register',),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                 Text('don,t have an account ?', style: Styles.textStyle16,),
                 Text('Login',style:TextStyle(color: Colors.purpleAccent, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
