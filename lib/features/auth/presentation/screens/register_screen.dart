import 'package:okazioun_souq/core/resources/assets_manager.dart';
import 'package:okazioun_souq/core/resources/color_manager.dart';
import 'package:okazioun_souq/core/resources/font_manager.dart';
import 'package:okazioun_souq/core/resources/styles_manager.dart';
import 'package:okazioun_souq/core/resources/values_manager.dart';
import 'package:okazioun_souq/core/routes/routes.dart';
import 'package:okazioun_souq/core/utils/validator.dart';
import 'package:okazioun_souq/core/widgets/custom_elevated_button.dart';
import 'package:okazioun_souq/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Insets.s20.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Sizes.s40.h,
                ),
                Center(child: SvgPicture.asset(SvgAssets.route)),
                SizedBox(
                  height: Sizes.s40.h,
                ),
                CustomTextField(
                  backgroundColor: ColorManager.white,
                  hint: 'enter your full name',
                  label: 'Full Name',
                  textInputType: TextInputType.name,
                  validation: Validator.validateFullName,
                  controller: _nameController,
                ),
                SizedBox(
                  height: Sizes.s18.h,
                ),
                CustomTextField(
                  hint: 'enter your mobile no.',
                  backgroundColor: ColorManager.white,
                  label: 'Mobile Number',
                  validation: Validator.validatePhoneNumber,
                  textInputType: TextInputType.phone,
                  controller: _phoneController,
                ),
                SizedBox(
                  height: Sizes.s18.h,
                ),
                CustomTextField(
                  hint: 'enter your email address',
                  backgroundColor: ColorManager.white,
                  label: 'E-mail address',
                  validation: Validator.validateEmail,
                  textInputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                SizedBox(
                  height: Sizes.s18.h,
                ),
                CustomTextField(
                  hint: 'enter your password',
                  backgroundColor: ColorManager.white,
                  label: 'password',
                  validation: Validator.validatePassword,
                  isObscured: true,
                  textInputType: TextInputType.text,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: Sizes.s50.h,
                ),
                Center(
                  child: SizedBox(
                    height: Sizes.s60.h,
                    width: MediaQuery.sizeOf(context).width * .9,
                    child: CustomElevatedButton(
                      label: 'Register',
                      backgroundColor: ColorManager.white,
                      isStadiumBorder: false,
                      textStyle: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s20,
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(Routes.home);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: getSemiBoldStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s16),
                    ),
                    SizedBox(
                      width: Sizes.s8.w,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed(Routes.login),
                      child: Text(
                        'Login',
                        style: getSemiBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: FontSize.s16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
