import 'package:easy_pro/src/core/router/app_router.dart';
import 'package:easy_pro/src/core/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EasyProApp extends StatelessWidget {
  EasyProApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(context),
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
        return MaterialApp.router(
          title: 'EasyPro',
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          theme: theme,
          // darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
