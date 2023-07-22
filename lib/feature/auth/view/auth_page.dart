import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_image.dart';
import '../../../utils/app_text.dart';
import 'login_page.dart';
import 'widget/button_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.sizeOf(context).width;
    final heightSize = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              const AppImage(
                imagePath: 'assets/logo/dummy_logo.png',
                width: 200,
                height: 200,
              ),
              const Spacer(),
              AppText(
                context: context,
                text: 'Dummy App',
                style: AppTextStyle.display1,
                fontWeight: CustomFontWeight.bold,
                color: AppColors.primaryWhite,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              AppText(
                context: context,
                text: 'What packages do you want to implement?',
                style: AppTextStyle.title1,
                fontWeight: CustomFontWeight.normal,
                color: AppColors.primaryWhite,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: widthSize,
                child: ButtonWidget(
                  widthSize: widthSize,
                  title: 'LOGIN',
                  gradientColor: const [
                    AppColors.gradientBlueOne,
                    AppColors.gradientBlueTwo,
                  ],
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  )),
                ),
              ),
              SizedBox(height: heightSize * 0.02),
              SizedBox(
                width: widthSize,
                child: ButtonWidget(
                  widthSize: widthSize,
                  title: 'SIGN UP',
                  backgroundColor: Colors.transparent,
                  sideColor: AppColors.gradientBlueOne,
                  widthSideColor: 2,
                  elevation: 0,
                  gradientColor: const [
                    Colors.transparent,
                    Colors.transparent,
                  ],
                  onPressed: () {},
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
