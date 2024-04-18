import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.isCentered = true,
  });

  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    const child = SizedBox(
      width: Dimens.doubleSpace,
      height: Dimens.doubleSpace,
      child: CircularProgressIndicator(),
    );
    if (isCentered) return const Center(child: child);
    return child;
  }
}

class SliverLoader extends StatelessWidget {
  const SliverLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: Dimens.padding.h),
      sliver: const SliverToBoxAdapter(
        child: Loader(),
      ),
    );
  }
}
