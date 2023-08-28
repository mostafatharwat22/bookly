import 'package:bookly_app/core/utilles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utilles/assets.dart';
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
            SizedBox(height: SizeConfig.defaultSize! * 18 ,),
            SvgPicture.asset(
              AssetsData.onBoardingImage3,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(height: SizeConfig.defaultSize! * 4,),
            const Text('Hello',style: Styles.textStyle30,textAlign: TextAlign.left,),
            SizedBox(height: SizeConfig.defaultSize! * 2,),
            const Text(
              'This Application is that it shows free books to the user about programming',
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: SizeConfig.defaultSize! * 18 ,),
            SvgPicture.asset(
              AssetsData.onBoardingImage1,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(height: SizeConfig.defaultSize! * 4,),
            const Text('E books' ,style:Styles.textStyle30,textAlign: TextAlign.left,),
            SizedBox(height: SizeConfig.defaultSize! * 2,),
            const Text(
              'Find a book,and start to reading the books.',
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
                 ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: SizeConfig.defaultSize! * 18 ,),
            SvgPicture.asset(
              AssetsData.onBoardingImage2,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(height: SizeConfig.defaultSize! * 4,),
            const Text('Go to start read',style: Styles.textStyle30,textAlign: TextAlign.left ),
            SizedBox(height: SizeConfig.defaultSize! * 2.5,),
            const Text(
              'Read the best books first , or you may not have a chance to read team at all',
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}

