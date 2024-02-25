import 'package:auto_route/auto_route.dart';
import 'package:notes_firebase_ddd/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase_ddd/presentation/spalsh/splash_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        )
      ];
}
