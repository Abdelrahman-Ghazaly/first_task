import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../cubit/log_in_cubit.dart';
import 'authentication_text_field.dart';
import 'log_in_button.dart';
import 'social_media_icon.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({
    super.key,
  });

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late TextEditingController _userName;

  late TextEditingController _password;

  @override
  void initState() {
    _userName = TextEditingController();
    _password = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Log In',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          AuthenticationTetField(
            controller: _userName,
            label: 'Username',
            icon: Icons.person_outline,
            hintText: 'Type your username',
          ),
          Column(
            children: [
              AuthenticationTetField(
                controller: _password,
                label: 'Password',
                icon: Icons.lock_outline,
                hintText: 'Type your password',
                isPassword: true,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot your password?'),
                ),
              ),
            ],
          ),
          LogInButton(
            onTap: () async {
              await context.read<LogInCubit>().logIn(
                    userName: _userName.text,
                    password: _password.text,
                  );
            },
          ),
          const Text('Or Sign Up Using'),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaIcons(
                icon: AppIcons.facebook,
              ),
              SocialMediaIcons(
                icon: AppIcons.twitter,
              ),
              SocialMediaIcons(
                icon: AppIcons.google,
                isGoogle: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
