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
      projectId: DotEnv.wiredashProjectID,
      secret: DotEnv.wiredashSecret,
      theme: WiredashThemeData(primaryColor: Palette.primary),
      child: MaterialApp(
        title: 'RM Translator',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Inder',
          primaryColor: Palette.primary,
          appBarTheme: const AppBarTheme(backgroundColor: Palette.scaffold),
          scaffoldBackgroundColor: Palette.scaffold,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Palette.primary,
            secondary: Palette.primary,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/nav': (context) => const NavScreen(),
          '/home': (context) => const HomeScreen(),
          '/favorite': (context) => const FavoritesScreen(),
          '/settings': (context) => const SettingsScreen(),
          '/share-app': (context) => const ShareAppScreen(),
          '/about': (context) => const AboutScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
