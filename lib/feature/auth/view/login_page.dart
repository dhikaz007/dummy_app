import 'package:flutter/material.dart';

import '../../../services/share_pref_helper.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_image.dart';
import '../../../utils/app_text.dart';
import '../../home_page/view/home_page.dart';
import 'widget/button_widget.dart';
import 'widget/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.sizeOf(context).width;
    final heightSize = MediaQuery.sizeOf(context).height;

    String userName = '';
    String password = '';

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const NeverScrollableScrollPhysics(),
          reverse: true,
          child: SizedBox(
            width: widthSize,
            height: heightSize - 55,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const Positioned(
                  top: 0,
                  left: 85,
                  child: AppImage(
                    imagePath: 'assets/logo/dummy_logo.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        AppColors.backgroundBlue,
                      ),
                      shape: MaterialStatePropertyAll(
                        CircleBorder(),
                      ),
                      side: MaterialStatePropertyAll(
                        BorderSide(
                          color: AppColors.primaryWhite,
                          width: 3,
                        ),
                      ),
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.all(12),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.primaryWhite,
                      size: 28,
                    ),
                  ),
                ),
                Positioned(
                  top: 250,
                  child: AppText(
                    context: context,
                    text: 'Welcome Back',
                    style: AppTextStyle.display1,
                    fontWeight: CustomFontWeight.bold,
                    color: AppColors.primaryWhite,
                  ),
                ),
                Positioned(
                  top: 300,
                  child: AppText(
                    context: context,
                    text: 'Login to your account',
                    style: AppTextStyle.title2,
                    fontWeight: CustomFontWeight.normal,
                    color: AppColors.primaryWhite,
                  ),
                ),
                Positioned(
                  top: 370,
                  left: 0,
                  right: 0,
                  child: TextFieldWigdet(
                    title: 'Username',
                    icon: Icons.account_circle_outlined,
                    onChanged: (value) => userName = value,
                  ),
                ),
                Positioned(
                  top: 450,
                  left: 0,
                  right: 0,
                  child: TextFieldWigdet(
                    title: 'Password',
                    obscureText: true,
                    icon: Icons.lock_clock_outlined,
                    onChanged: (value) => password = value,
                  ),
                ),
                Positioned(
                  bottom: 165,
                  right: 0,
                  child: TextButton(
                    onPressed: () {},
                    child: AppText(
                      context: context,
                      text: 'Forgot Password?',
                      style: AppTextStyle.title3,
                      fontWeight: CustomFontWeight.normal,
                      color: AppColors.primaryWhite,
                    ),
                  ),
                ),
                //* Implement write 
                Positioned(
                  bottom: 90,
                  left: 0,
                  right: 0,
                  child: ButtonWidget(
                    widthSize: widthSize,
                    title: 'LOGIN',
                    gradientColor: const [
                      AppColors.gradientBlueOne,
                      AppColors.gradientBlueTwo,
                    ],
                    onPressed: () => SharePrefHelper.loginState(
                      userName: userName,
                      password: password,
                      isLoggedIn: true,
                    ).then((value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) =>
                              HomePage(userName: value.userName),
                        ),
                        (route) => false)),
                  ),
                ),
                Positioned(
                  bottom: 55,
                  left: 0,
                  right: 0,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: [
                      AppText(
                        context: context,
                        text: "Don't have an account?",
                        style: AppTextStyle.title3,
                        fontWeight: CustomFontWeight.normal,
                        color: AppColors.primaryWhite,
                      ),
                      AppText(
                        context: context,
                        text: 'Sign Up',
                        style: AppTextStyle.title3,
                        fontWeight: CustomFontWeight.bold,
                        color: AppColors.primaryWhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
