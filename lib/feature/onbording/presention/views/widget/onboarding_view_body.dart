import 'package:bookly_app/feature/onbording/presention/views/widget/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utilles/app_router.dart';
import '../../../../../core/utilles/media_query.dart';
import 'custom_elvated.dart';
import 'custon_dots.dart';
class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
    )..addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 130,
          child: CustomDotsIndicator(
            dotIndex: pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 7.5,
          right: 20,
          child:const Text(
            'Skip',
            style:TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.left,
          ),
        ),
    Positioned(
      left: SizeConfig.defaultSize! * 1,
      right: SizeConfig.defaultSize! * 1,
      bottom: SizeConfig.defaultSize! * 6,
      child:  CustomElevatedButton(
            onTap: (){
              if(pageController!.page!< 2){
                pageController!.nextPage(
                    duration: const Duration(microseconds: 500),
                    curve: Curves.easeIn,
                );
              }else{
                GoRouter.of(context).push(AppRouter.kLoginView,);
              }
            },
            text: pageController!.hasClients
                ? (pageController?.page == 2 ? 'Get Started' : 'Next')
                : 'Next',
          ),
    ),
      ],
    );
  }
}
