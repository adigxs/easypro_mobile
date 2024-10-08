import 'package:easy_pro/src/core/router/app_router.dart';
import 'package:easy_pro/src/core/themes/theme_cubit.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/laguage_state.dart';
import 'package:easy_pro/src/features/criminal_record_form/logic/language/language_bloc.dart';
import 'package:easy_pro/src/shared/dio/locator.dart';
import 'package:easy_pro/src/shared/services/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EasyProApp extends StatelessWidget {
  EasyProApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(context),
          child: this,
        ),
        BlocProvider(
            create: (_) =>
                LanguageBloc(secureStorage: locator<SecureStorage>()),
            child: this),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
        return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
          return MaterialApp.router(
            title: 'EasyPro',
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: theme,
            locale: state.selectedLanguage.value,
            // darkTheme: AppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          );
        });
      }),
    );
  }
}
