import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/helpers/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/common/widgets/button/basic_app_button.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';
import 'package:spotify_app/core/configs/theme/app_fontSize.dart';
import 'package:spotify_app/data/models/create_user_request.dart';
import 'package:spotify_app/domain/usecases/auth/signup.dart';
import 'package:spotify_app/presentation/auth/pages/signin.dart';
import 'package:spotify_app/presentation/root/pages/root.dart';
import 'package:spotify_app/service_locator.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  void navigateToChooseMode(BuildContext context, Widget targetPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => targetPage),
    );
  }

  Future<void> signup(BuildContext context) async {
    var result = await sl<SignUpUseCase>().call(
      params: CreateUserRequest(
        fullName: _fullName.text.toString(),
        email: _email.text.toString(),
        password: _password.text.toString(),
      ),
    );

    result.fold(
      (l) {
        var snackBar = SnackBar(content: Text(l));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      (r) {
        navigateToChooseMode(context, const RootPage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(AppVectors.logo, width: 40, height: 40),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(height: 15),
            _supportText(context),
            _fullNameField(context),
            _emailField(context),
            _passwordField(context),
            SizedBox(height: 10),
            BasicAppButton(
              onPressed: () async {
                await signup(context);
              },
              textContent: 'Create Account',
            ),
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

  Widget _fullNameField(BuildContext context) => TextField(
    controller: _fullName,
    decoration: InputDecoration(
      hintText: 'Full Name',
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );

  Widget _emailField(BuildContext context) => TextField(
    controller: _email,
    decoration: InputDecoration(
      hintText: 'Enter Email',
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );

  Widget _passwordField(BuildContext context) => TextField(
    controller: _password,
    decoration: InputDecoration(
      hintText: 'Enter Password',
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );

  Widget _signinText(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 50),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do you have an account?',
          style: TextStyle(
            color: context.isDarkMode ? Colors.white : Colors.black,
            fontSize: AppFontSize.s16,
          ),
        ),
        TextButton(
          onPressed: () => navigateToChooseMode(context, SignInPage()),
          child: Text(
            'Sign In',
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
