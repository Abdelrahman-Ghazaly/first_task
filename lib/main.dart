import 'package:first_assignment/core/services/injection_container.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_friends_use_case.dart';
import 'package:first_assignment/features/home/domain/use_cases/get_sponsers_use_case.dart';
import 'package:first_assignment/features/home/presentation/provider/friends_provider.dart';
import 'package:first_assignment/features/home/presentation/provider/sponser_provider.dart';
import 'package:first_assignment/features/log_in/domain/use_cases/log_in_use_case.dart';
import 'package:first_assignment/features/log_in/presentation/provider/log_in_provider.dart';
import 'package:first_assignment/features/log_in/presentation/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LogInProvider(logInUseCase: sl<LogInUseCase>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              FriendsProvider(getFriendsUseCase: sl<GetFriendsUseCase>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              SponserProvider(getSponsersUseCase: sl<GetSponsersUseCase>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LogInScreen(),
    );
  }
}
