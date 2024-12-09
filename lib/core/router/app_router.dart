import 'package:auto_route/auto_route.dart';
import 'package:msn2/authentication/presentation/login_page.dart';
import 'package:msn2/authentication/presentation/register_page.dart';
import 'package:msn2/core/presentation/main_page.dart';
import 'package:msn2/friends/presentation/dm_page.dart';
import 'package:msn2/friends/presentation/friends_page.dart';
import 'package:msn2/main/presentation/user_main_page.dart';
import 'package:msn2/messages/presentation/chat_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RedirectingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: UserMainRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: RegisterRoute.page,
        ),
        AutoRoute(
          page: DmRoute.page,
        ),
        AutoRoute(
          page: FriendsRoute.page,
        ),
        AutoRoute(
          page: ChatRoute.page,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
