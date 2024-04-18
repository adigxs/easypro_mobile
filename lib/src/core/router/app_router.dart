import 'package:auto_route/auto_route.dart';
import 'package:easy_pro/src/core/router/wrapper/main_wrapper.dart';
import 'package:easy_pro/src/features/criminal_record_form/criminal_record_screen.dart';
import 'package:easy_pro/src/features/splash_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: SplashScreen,
        initial: true,
        transitionsBuilder: TransitionsBuilders.zoomIn),
    CustomRoute(
        path: '',
        page: MainWrapper,
        name: 'MainRoute',
        // guards: [AuthenticationGuard],
        transitionsBuilder: TransitionsBuilders.fadeIn,
        children: [
          CustomRoute(
              initial: true,
              page: CriminalRecordScreen,
              transitionsBuilder: TransitionsBuilders.slideRight),
        ]),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter();
}
