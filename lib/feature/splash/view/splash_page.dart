import 'dart:async';

import 'package:flutter/material.dart';

import '../../../services/share_pref_helper.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_image.dart';
import '../../../utils/app_text.dart';
import '../../auth/view/auth_page.dart';
import '../../home_page/view/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLogin = false;
  String user = 'Guest';

  @override
  void initState() {
    super.initState();
    isLogin = SharePrefHelper.checkLogin();
    user = SharePrefHelper.getUser();
    debugPrint('Login: $isLogin\nUSER : $user');
    checkRouting();
  }

  //* Check data
  void checkRouting() async {
    Future.delayed(const Duration(seconds: 2), () {
      if (isLogin == true) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(userName: user),
        ));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const AppImage(
              imagePath: 'assets/logo/dummy_logo.png',
              width: 200,
              height: 200,
            ),
            const Spacer(),
            const CircularProgressIndicator(color: AppColors.primaryWhite),
            const Spacer(),
            AppText(
              context: context,
              text: 'Loading',
              style: AppTextStyle.headline2,
              fontWeight: CustomFontWeight.bold,
              color: AppColors.primaryWhite,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
