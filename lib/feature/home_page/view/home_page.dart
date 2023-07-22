import 'package:flutter/material.dart';

import '../../../services/share_pref_helper.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';
import '../../splash/view/splash_page.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBlue,
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 2),
            AppText(
              context: context,
              text: 'Welcome, $userName',
              style: AppTextStyle.headline1,
              fontWeight: CustomFontWeight.bold,
              color: AppColors.primaryWhite,
            ),
            const Spacer(),
            //* Implement delete
            ElevatedButton(
              onPressed: () => SharePrefHelper.logoutState().then(
                (value) => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const SplashPage(),
                    ),
                    (route) => false),
              ),
              child: AppText(
                context: context,
                text: 'Logout',
                style: AppTextStyle.title2,
                fontWeight: CustomFontWeight.bold,
                color: AppColors.primaryWhite,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
