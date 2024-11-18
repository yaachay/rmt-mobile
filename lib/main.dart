import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/screens/screens.dart';
import 'package:wiredash/wiredash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: Data.wiredashProjectID,
      secret: Data.wiredashSecret,
      child: MaterialApp(
        title: 'RM Translator',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Inder',
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/nav': (context) => const NavScreen(),
          '/home': (context) => const HomeScreen(),
          '/ai-generator': (context) => const AiGeneratorScreen(),
          '/favorite': (context) => const FavoritesScreen(),
          '/share-app': (context) => const ShareAppScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/about': (context) => const AboutScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
