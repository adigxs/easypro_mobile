import 'package:easy_pro/generated/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_pro/src/core/router/app_router.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/components/loader.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4))
        .then((_) => {context.router.replace(const MainRoute())});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.onBackground),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: SvgPicture.asset(
                          Assets.logos.logo3,
                        )),
                    SizedBox(
                      height: Dimens.space.h,
                    ),
                  ],
                ),
              ),
              const Loader(),
              SizedBox(
                height: Dimens.ultraSpace.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
