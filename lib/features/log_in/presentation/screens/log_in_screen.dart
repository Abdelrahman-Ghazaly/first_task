import 'package:flutter/material.dart';

import 'package:first_assignment/core/constants/constants.dart';
import 'package:first_assignment/features/log_in/presentation/widgets/widgets.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDeafultPadding),
          child: Column(
            children: [
              const LogInForm(),
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
