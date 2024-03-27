import 'package:chronosync/model/activity_database.dart';
import 'package:chronosync/pages/splash.dart';
import 'package:chronosync/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ActivityDatabase.initialize();
  // runApp(
  //     ChangeNotifierProvider(
  //         create: (context)=> ActivityDatabase(),
  //       child: const MyApp(),
  //     ),
  // );
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ActivityDatabase(),
          ),
          ChangeNotifierProvider(
              create: (context) => ThemeProvider(),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const SplashScreen(),
    );
  }
}

