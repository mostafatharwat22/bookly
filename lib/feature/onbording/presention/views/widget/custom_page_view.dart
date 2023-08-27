import 'package:bookly_app/core/utilles/styles.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utilles/media_query.dart';


class CustomPageView extends StatelessWidget {
  const CustomPageView({Key? key, this.pageController}) : super(key: key);
  final PageController ?pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        Column(
          children: [
            SizedBox(height: SizeConfig.defaultSize! * 15 ,),
            Image.asset('assets/images/OIP.jpg',),
            SizedBox(height: SizeConfig.defaultSize! * 4,),
            const Text('Hello',style: Styles.textStyle30,textAlign: TextAlign.left,),
            SizedBox(height: SizeConfig.defaultSize! * 2,),
            const Text(
              'This application is that it shows free books to the user about programming.',
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: SizeConfig.defaultSize! * 18 ,),
            Image.asset('assets/images/rr.jpg',),
            SizedBox(height: SizeConfig.defaultSize! * 4,),
            const Text('E books' ,style:Styles.textStyle30,textAlign: TextAlign.left,),
            SizedBox(height: SizeConfig.defaultSize! * 2.5,),
            const Text(
              'Find a book,and start to reading the books.',
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
                 ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: SizeConfig.defaultSize! * 20 ,),
            Image.asset('assets/images/R (1).jpg',),
            SizedBox(height: SizeConfig.defaultSize! * 6,),
            const Text('Go to start read',style: Styles.textStyle30,textAlign: TextAlign.left ),
            SizedBox(height: SizeConfig.defaultSize! * 3,),
            const Text(
              'Click on the word Get started to start the process '
                  'of logging in to view content !...',
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

