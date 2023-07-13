import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/home/presentation/screens/home_screen.dart';
import 'package:first_assignment/features/log_in/presentation/cubit/log_in_cubit.dart';
import 'package:first_assignment/features/log_in/presentation/provider/log_in_provider.dart';
import 'package:first_assignment/features/log_in/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late TextEditingController _userName;
  late TextEditingController _password;
  bool isVisible = true;

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
                    BlocListener<LogInCubit, LogInState>(
                      listener: (context, state) {
                        if (state is Success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: Text(
                                  state.message,
                                ),
                              ),
                              backgroundColor: AppColors.green,
                            ),
                          );
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const HomeScreen(),
                              ));
                        } else if (state is Error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Center(
                                child: Text(
                                  state.message,
                                ),
                              ),
                              backgroundColor: AppColors.red,
                            ),
                          );
                        }
                      },
                      child: LogInButton(
                        onTap: () async {
                          // await context.read<LogInProvider>().logIn(
                          //       context,
                          //       userName: _userName.text,
                          //       password: _password.text,
                          //     );
                          await context.read<LogInCubit>().logIn(
                                userName: _userName.text,
                                password: _password.text,
                              );
                        },
                      ),
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
