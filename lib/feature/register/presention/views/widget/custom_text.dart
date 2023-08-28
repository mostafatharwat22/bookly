import 'package:flutter/cupertino.dart';

import '../../../../../core/utilles/styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.text}) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(right: 230),
    child: Text(text,style: Styles.textStyle30,),
    );
  }
}
