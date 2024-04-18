// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
        transitionsBuilder: TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const MainWrapper(),
        transitionsBuilder: TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CriminalRecordRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CriminalRecordScreen(),
        transitionsBuilder: TransitionsBuilders.slideRight,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          MainRoute.name,
          path: '',
          children: [
            RouteConfig(
              CriminalRecordRoute.name,
              path: '',
              parent: MainRoute.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [MainWrapper]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [CriminalRecordScreen]
class CriminalRecordRoute extends PageRouteInfo<void> {
  const CriminalRecordRoute()
      : super(
          CriminalRecordRoute.name,
          path: '',
        );

  static const String name = 'CriminalRecordRoute';
}
