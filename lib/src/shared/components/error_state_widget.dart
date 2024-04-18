import 'dart:io';

import 'package:easy_pro/generated/assets.gen.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/datasource/models/api_response.dart';
import 'package:easy_pro/src/shared/components/action_button.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
    required this.error,
    this.retry,
  });

  final ApiError error;
  final VoidCallback? retry;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(Dimens.padding.w),
        child: Column(
          children: [
            Row(
              children: [
                Assets.images.loadingErrorState.image(
                  width: Dimens.assetSize,
                  height: Dimens.assetSize,
                ),
                const SizedBox(width: Dimens.space),
                Expanded(
                  child: Text(
                    error.message,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: const Color(0XFF919297)),
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: Dimens.space),
                ActionButton(
                  icon: Icons.refresh,
                  onPressed: () {
                    if (error.error is DioError &&
                        (error.error as DioError).response?.statusCode ==
                            HttpStatus.unauthorized) {
                      // context.read<CurrentUserProfileCubit>().logout();
                    } else {
                      retry?.call();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: Dimens.space),
            const LinearProgressIndicator(
              value: 1.0,
              color: Color(0xFFF2856D),
            ),
          ],
        ),
      ),
    );
  }
}
