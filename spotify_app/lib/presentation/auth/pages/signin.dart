import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_fontsize.dart';
import 'package:spotify_app/data/models/auth/signin_user_request.dart';
import 'package:spotify_app/domain/usecases/auth/signin.dart';
import 'package:spotify_app/presentation/auth/pages/signup.dart';
import 'package:spotify_app/presentation/home/pages/home.dart';
import 'package:spotify_app/service_locator.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void navigateToChooseMode(BuildContext context, Widget targetPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => targetPage),
    );
  }

  Future<void> signin(BuildContext context) async {
    var result = await sl<SigninUsecase>().call(
      params: SigninUserRequest(
        email: _email.text.toString(),
        password: _password.text.toString(),
      ),
    );

    result.fold(
      (l) {
        var snackBar = SnackBar(
          content: Text(l),
          behavior: SnackBarBehavior.floating,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      (r) {
        navigateToChooseMode(context, const HomePage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppBar(
        leadingIcon: Icons.arrow_back_ios_new,
        onLeadingPressed: () => Navigator.pop(context),
        title: SvgPicture.asset(AppVectors.logo, width: 40, height: 40),
      ),
      body: SingleChildScrollView(
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
              onPressed: () => signin(context),
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
    controller: _email,
    decoration: InputDecoration(
      hintText: 'Enter Username or Email',
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );

  Widget _passwordField(BuildContext context) => TextField(
    controller: _password,
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
