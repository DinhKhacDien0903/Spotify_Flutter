import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_fontSize.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.logo, width: 40, height: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(height: 15),
            _supportText(context),
            SizedBox(height: 26),
            _fullNameField(),
            // Add your sign-up form widgets here
          ],
        ),
      ),
    );
  }

  Widget _registerText() => Text(
    'Register',
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
  Widget _fullNameField() => TextField(
    decoration: InputDecoration(hintText: 'Full Name'),
    style: TextStyle(fontSize: AppFontSize.s16),
  );
}
