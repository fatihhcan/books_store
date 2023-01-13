import 'package:books_store/core/components/buttons/custom_button.dart';
import 'package:books_store/core/components/text_form_field/custom_text_form_field.dart';
import 'package:books_store/core/constants/text/text_constants.dart';
import 'package:books_store/core/extensions/context_extensions.dart';
import 'package:books_store/core/utility/reqex.dart';
import 'package:books_store/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/constants/images/image_constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthCubit>(
      cubit: AuthCubit(),
      onCubitReady: (cubit) {
        cubit.setContext(context);
        cubit.init();
      },
      onPageBuilder: (AuthCubit cubit) => Scaffold(
          resizeToAvoidBottomInset: false, 
          backgroundColor: context.appColors.scaffoldBackgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                context.sizedBoxNormalVertical,
                buildAppLogo(context),
                SizedBox(
                  height: context.normalValue * 3,
                ),
                Padding(
                  padding: context.paddingLowHorizontal * 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      welcomeBackText(context),
                      context.sizedBoxLowVertical,
                      loginToYourAccountText(context),
                      SizedBox(
                        height: context.normalValue * 3,
                      ),
                      titleEmail(context),
                      context.sizedBoxLowVertical,
                      buildEmail(cubit),
                      context.sizedBoxNormalVertical,
                      titlePassword(context),
                      context.sizedBoxLowVertical,
                      buildPassword(cubit),
                    ],
                  ),
                ),
                Padding(
                  padding: context.paddingLowHorizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      rememberMeCheckBox(cubit),
                      rememberMeText(context),
                      SizedBox(
                        width: context.lowValue * 20.5,
                      ),
                      registerTextButton(cubit, context),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.mediumValue * 4,
                ),
                buildLoginButton(cubit)
              ],
            ),
          )),
    );
  }

  GestureDetector registerTextButton(AuthCubit cubit, BuildContext context) {
    return GestureDetector(
                      onTap: () => cubit.navigationRegister(),
                      child: Text(
                        TextConstants.register,
                        style: context.textTheme.subtitle1!
                            .copyWith(color: context.appColors.royalBlue),
                      ),
                    );
  }

  Text rememberMeText(BuildContext context) {
    return Text(
                      TextConstants.rememberMe,
                      style: context.textTheme.subtitle1!
                          .copyWith(color: context.appColors.royalBlue),
                    );
  }

  BlocBuilder<AuthCubit, AuthState> rememberMeCheckBox(AuthCubit cubit) {
    return BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return Checkbox(
                          side:
                              BorderSide(color: context.appColors.royalBlue),
                          value: state.rememberMe,
                          onChanged: (bool? value) {
                            cubit.rememberMeCheckBox(value!);
                          },
                          activeColor: context.appColors.royalBlue,
                        );
                      },
                    );
  }

  Text titlePassword(BuildContext context) {
    return Text(
                      TextConstants.password,
                      style: context.textTheme.headline5!
                          .copyWith(color: context.appColors.violet),
                    );
  }

  Text titleEmail(BuildContext context) {
    return Text(
                      TextConstants.email,
                      style: context.textTheme.headline5!
                          .copyWith(color: context.appColors.violet),
                    );
  }

  Text loginToYourAccountText(BuildContext context) {
    return Text(
                      TextConstants.loginToYourAccount,
                      style: context.textTheme.headline4!
                          .copyWith(color: context.appColors.titleColor),
                    );
  }

  Text welcomeBackText(BuildContext context) {
    return Text(
                      TextConstants.welcomeBack,
                      style: context.textTheme.headline5!.copyWith(
                          color:
                              context.appColors.royalBlue.withOpacity(0.6)),
                    );
  }

  CustomButton buildLoginButton(AuthCubit cubit) {
    return CustomButton(
                title: TextConstants.login,
                onTap: () => cubit.login(cubit.controllerEmail!.text,
                    cubit.controllerPassword!.text),
              );
  }

  CustomTextFormField buildPassword(AuthCubit cubit) {
    return CustomTextFormField(
                      controller: cubit.controllerPassword,
                      hintText: TextConstants.hintTextPassword,
                      validator: validatePassword,
                      obscureText: true,
                      maxLength: 20,
                      autovalidateMode: AutovalidateMode.always,
                    );
  }

  CustomTextFormField buildEmail(AuthCubit cubit) {
    return CustomTextFormField(
                      controller: cubit.controllerEmail,
                      hintText: TextConstants.hintTextEmail,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.always,
                    );
  }

  Padding buildAppLogo(BuildContext context) {
    return Padding(
                padding: context.paddingMediumHorizontal * 5,
                child: Image.asset(ImageConstants.instance.authLogo),
              );
  }
}
