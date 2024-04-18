import 'package:easy_pro/generated/assets.gen.dart';
import 'package:easy_pro/src/core/themes/dimens.dart';
import 'package:easy_pro/src/datasource/models/request_responese.dart';
import 'package:easy_pro/src/shared/utils/sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestFolder extends StatelessWidget {
  const RequestFolder(
      {super.key,
      required this.onTap,
      required this.request,
      required this.files});
  final Function()? onTap;
  final RequestResponse request;
  final List<int> files;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.radius.w),
            color: Theme.of(context).colorScheme.onPrimary),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(Dimens.halfPadding.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SvgPicture.asset(Assets.icons.folder),
                      Text(request.code,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onError)),
                      Flexible(
                        child: Text(request.regionOfBirth,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onError
                                        .withOpacity(0.7))),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimens.halfRadius),
                            color: Theme.of(context).colorScheme.outline),
                        child: Padding(
                          padding: EdgeInsets.all(Dimens.smPadding.w),
                          child: Text(request.status,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background)),
                        ),
                      )
                    ],
                  ),
                  Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .onError
                          .withOpacity(0.2)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ouvert: 10-02-2024',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onError
                                      .withOpacity(0.5))),
                      Flexible(
                        child: Text(request.court,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onError
                                        .withOpacity(0.7))),
                      ),
                      Row(
                        children: [
                          Text('${files.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                          SizedBox(
                              height: 16,
                              child: SvgPicture.asset(Assets.icons.paperclip2)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            // Positioned(
            //     bottom: 2,
            //     right: 4,
            //     child: Row(
            //       children: [
            //         Text('4',
            //             style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //                 fontWeight: FontWeight.w600,
            //                  fontSize: 8,
            //                 color: Theme.of(context).colorScheme.onBackground)),
            //         SizedBox(
            //             height: 16,
            //             child: SvgPicture.asset(Assets.icons.paperclip2)),
            //       ],
            //     ))
          ],
        ),
      ),
    );
  }
}
