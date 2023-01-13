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

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                      welcome(context),
                      context.sizedBoxLowVertical,
                      registerAnAccountText(context),
                      SizedBox(
                        height: context.normalValue * 3,
                      ),
                      titleName(context),
                      context.sizedBoxLowVertical,
                      buildName(cubit),
                      context.sizedBoxLowVertical,
                      titleEmail(context),
                      context.sizedBoxLowVertical,
                      buildEmail(cubit),
                      context.sizedBoxLowVertical,
                      titlePassword(context),
                      context.sizedBoxLowVertical,
                      buildPassword(cubit),
                       context.sizedBoxLowVertical,
                      Container(
                        alignment: Alignment.centerRight,
                        child: loginTextButton(cubit, context)),
                       
                    ],
                  ),
                ),
                SizedBox(
                  height: context.mediumValue * 2,
                ),
                buildRegisterButton(cubit)
              ],
            ),
          )),
    );
  }

  GestureDetector loginTextButton(AuthCubit cubit, BuildContext context) {
    return GestureDetector(
                      onTap: () => cubit.navigationLogin(),
                      child: Text(
                        TextConstants.login,
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

  Text titleName(BuildContext context) {
    return Text(
                      TextConstants.name,
                      style: context.textTheme.headline5!
                          .copyWith(color: context.appColors.violet),
                    );
  }

  Text registerAnAccountText(BuildContext context) {
    return Text(
                      TextConstants.registerAnAccount,
                      style: context.textTheme.headline4!
                          .copyWith(color: context.appColors.titleColor),
                    );
  }

  Text welcome(BuildContext context) {
    return Text(
                      TextConstants.welcome,
                      style: context.textTheme.headline5!.copyWith(
                          color:
                              context.appColors.royalBlue.withOpacity(0.6)),
                    );
  }

  CustomButton buildRegisterButton(AuthCubit cubit) {
    return CustomButton(
                title: TextConstants.register,
                onTap: () => cubit.register(cubit.controllerEmail!.text, cubit.controllerName!.text,
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
    CustomTextFormField buildName(AuthCubit cubit) {
    return CustomTextFormField(
                      controller: cubit.controllerName,
                      hintText: TextConstants.hintTextName,
                    );
  }

  Padding buildAppLogo(BuildContext context) {
    return Padding(
                padding: context.paddingMediumHorizontal * 5,
                child: Image.asset(ImageConstants.instance.authLogo),
              );
  }
}
