import 'package:first_assignment/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/screens/home_screen.dart';
import '../cubit/log_in_cubit.dart';
import 'loading_dialog.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.onTap,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogInCubit, LogInState>(
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
        } else if (state is Loading) {
          showDialog(
            context: context,
            builder: (context) => const LoadingDialog(),
          );
        }
      },
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
