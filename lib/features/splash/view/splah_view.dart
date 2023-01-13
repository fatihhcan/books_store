import 'package:books_store/core/components/buttons/custom_button.dart';
import 'package:books_store/core/constants/images/image_constants.dart';
import 'package:books_store/core/constants/text/text_constants.dart';
import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:books_store/features/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashCubit>(
      cubit: SplashCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (SplashCubit cubit) => Scaffold(
          backgroundColor: context.appColors.splashBackgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              context.sizedBoxMediumVertical,
              Image.asset(ImageConstants.instance.splashLogo),
              context.sizedBoxHighVertical,
              buildButtons(context, cubit),
            ],
          )),
    );
  }

  Padding buildButtons(BuildContext context, SplashCubit cubit) {
    return Padding(
      padding: context.paddingLowHorizontal * 2,
      child: Column(
        children: [
          buildLogin(context, cubit),
          context.sizedBoxLowVertical,
          buildSkip(context)
        ],
      ),
    );
  }

  GestureDetector buildSkip(BuildContext context) => GestureDetector(
      onTap: () {},
      child: Text(TextConstants.skip,
          style: context.textTheme.headline5!
              .copyWith(color: context.appColors.royalBlue)));

  CustomButton buildLogin(BuildContext context, SplashCubit cubit) {
    return CustomButton(
      title: TextConstants.login,
      onTap: () {
         cubit.navigationLogin();
        //route
      },
    );
  }
}
