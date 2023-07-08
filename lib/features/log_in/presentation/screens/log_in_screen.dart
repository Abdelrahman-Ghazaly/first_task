import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/presentation/provider/friends_provider.dart';
import 'package:first_assignment/features/home/presentation/provider/sponser_provider.dart';
import 'package:first_assignment/features/home/presentation/screens/home_screen.dart';
import 'package:first_assignment/features/log_in/domain/entities/user_entity.dart';
import 'package:first_assignment/features/log_in/presentation/provider/log_in_provider.dart';
import 'package:first_assignment/features/log_in/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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

  void _showSnackBar({required String message, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        backgroundColor: color,
      ),
    );
  }

  Future<void> _getData(BuildContext context) async {
    await context.read<FriendsProvider>().getFriends();
    await context.read<SponserProvider>().getSponser();
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity? userEntity =
        context.select<LogInProvider, UserEntity?>((value) => value.userEntity);

    final String errorMessage =
        context.select<LogInProvider, String>((value) => value.errorMessage);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDeafultPadding),
          child: Column(
            children: [
              Expanded(
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
                        await context.read<LogInProvider>().logIn(
                              userName: _userName.text,
                              password: _password.text,
                            );
                        if (userEntity != null) {
                          if (!mounted) return;
                          _getData(context);
                          _showSnackBar(
                            message: 'Logged in successfully',
                            color: AppColors.green,
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        } else if (errorMessage != '') {
                          _showSnackBar(
                            message: errorMessage,
                            color: AppColors.red,
                          );
                        }
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
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Or Sign Up Using'),
                    TextButton(
                      onPressed: () {},
                      child: const Text('SIGN UP'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
