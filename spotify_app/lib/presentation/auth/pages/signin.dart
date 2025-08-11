import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_fontsize.dart';
import 'package:spotify_app/presentation/auth/pages/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  void navigateToChooseMode(BuildContext context, Widget targetPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => targetPage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.logo, width: 40, height: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signInText(),
            SizedBox(height: 15),
            _supportText(context),
            _userNameOrEmailField(context),
            _passwordField(context),
            SizedBox(height: 10),
            BasicAppButton(
              onPressed: () {
                // Handle sign-up logic
              },
              textContent: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInText() => Text(
    'Sign In',
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: AppFontSize.s26, fontWeight: FontWeight.bold),
  );

  Widget _supportText(BuildContext context) => RichText(
    text: TextSpan(
      text: 'If you need any support ',
      style: TextStyle(
        color: context.isDarkMode ? Colors.white : Colors.black,
        fontSize: AppFontSize.s16,
      ),
      children: [
        TextSpan(
          text: 'click here',
          style: TextStyle(color: AppColors.primary),
        ),
      ],
    ),
  );

  Widget _userNameOrEmailField(BuildContext context) => TextField(
    decoration: InputDecoration(
      hintText: 'Enter Username or Email',
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );

  Widget _passwordField(BuildContext context) => TextField(
    decoration: InputDecoration(
      hintText: 'Password',
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );

  Widget _signupText(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not A Member ?',
          style: TextStyle(
            color: context.isDarkMode ? Colors.white : Colors.black,
            fontSize: AppFontSize.s16,
          ),
        ),

        TextButton(
          onPressed: () => navigateToChooseMode(context, SignUpPage()),
          child: Text(
            'Register Now',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: AppFontSize.s16,
            ),
          ),
        ),
      ],
    ),
  );
}
