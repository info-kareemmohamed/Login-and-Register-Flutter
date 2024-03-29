import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab/login/screens/pages/signup.dart';

import '../../../styles/icon_broken.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_text_style.dart';
import '../../../utils/space.dart';
import '../../cubit/LoginCubit/LoginCubit.dart';
import '../../cubit/LoginCubit/LoginStates.dart';
import '../widget/main_button.dart';
import '../widget/text_field.dart';


class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginStates>(
      builder: (context, state) {
        return Form(
          key: fromKey,
          child: Scaffold(
            backgroundColor: AppColors.darkTheme,
            body: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SpaceVH(height: 50.0),
                    Image.asset(
                      AppImages.huluLogo,
                      width: 170,
                      fit: BoxFit.fill,
                    ),
                    const SpaceVH(height: 50),
                    customTextField(
                      controller: userEmailController,
                      keyBordType: TextInputType.emailAddress,
                      icon: IconBroken.Profile,
                      hintTxt: 'Email',
                      validator: (value) {
                        if (value.isEmpty) {
                          return '       Please Enter Email Address';
                        }
                        if (!cubit.isValidEmail(value)) {
                          return '       Please Enter a Valid Email Address';
                        }
                        if (!cubit.isGmailEmail(value)) {
                          return '       Please Enter a Valid Gmail Address';
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    customTextField(
                      controller: userPassController,
                      keyBordType: TextInputType.text,
                      icon:
                          cubit.visibility ? IconBroken.Show : IconBroken.Hide,
                      isObs: cubit.visibility,
                      visible: () {
                        cubit.changePasswordVisibility();
                      },
                      hintTxt: 'Password',
                      validator: (value) {
                        if (value.isEmpty) {
                          return '       Please Enter Password';
                        }
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppTextStyle.regular(
                              color: AppColors.lightRed,
                              fontSize: 12.9,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SpaceVH(height: 20.0),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => Mainbutton(
                              onTap: () {
                                if (fromKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                        email: userEmailController.text,
                                        password: userPassController.text,
                                        context: context,
                                      );
                                }
                              },
                              text: 'Sign in',
                              txtColor: AppColors.darkTheme,
                              btnColor: AppColors.primary,
                            ),
                            fallback: (context) => const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have account?',
                                style: AppTextStyle.regular(
                                  fontSize: 14.12,
                                  color: AppColors.lightRed,
                                ),
                              ),
                              TextButton(
                                child: Text(
                                  'Register',
                                  style: AppTextStyle.regular(
                                    fontSize: 14.12,
                                    color: AppColors.primary,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) => SignUpPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
