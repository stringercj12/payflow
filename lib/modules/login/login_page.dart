import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

import '../../shared/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Container(
              child: Positioned(
                top: 40,
                left: 90,
                right: 90,
                child: AnimatedCard(
                  direction: AnimatedCardDirection.top,
                  duration: const Duration(milliseconds: 400),
                  child: Image.asset(
                    AppImages.person,
                    width: 208,
                    height: 300,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    direction: AnimatedCardDirection.left,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      children: [
                        Image.asset(
                          AppImages.logomini,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70, right: 70),
                          child: Text(
                            "Organize seus boletos em um só lugar",
                            textAlign: TextAlign.center,
                            style: TextStyles.titleHome,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedCard(
                    direction: AnimatedCardDirection.bottom,
                    duration: const Duration(milliseconds: 600),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 70),
                      child: SocialLoginButton(
                        onTap: () {
                          controller.googleSignIn(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
