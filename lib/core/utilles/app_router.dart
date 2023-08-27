import 'package:bookly_app/feature/home/presention/manger/featch_newest_books/featch_newest_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../feature/home/data/repos/home_repo_impl.dart';
import '../../feature/home/domin/entities/book_entity.dart';
import '../../feature/home/domin/use_cases/fetch_newest_books_use_case.dart';
import '../../feature/home/presention/views/book_details_view.dart';
import '../../feature/home/presention/views/home_view.dart';
import '../../feature/login/presention/views/login_view.dart';
import '../../feature/onbording/presention/views/onbording_view.dart';
import '../../feature/search/presention/views/search_view.dart';
import '../../feature/splash/presentation/view/splash_view.dart';
import 'fanction/setup_service.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kLoginView = '/LoginView';
  static const kOnBoardingView = '/OnBoardingView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
          path: kBookDetailsView,
          builder: (context, state) {
            BookEntity bookModel = state.extra as BookEntity;
            return BlocProvider(
              create: (context) => FetchNewestBooksCubit(
                FetchNewestBooksUseCase(
                  getIt.get<HomeRepoImpl>(),
                ),
              ),
              child: BookDetailsView(bookModel: bookModel,),
            );
          }
      ),
    ],
  );
}
