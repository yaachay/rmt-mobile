import 'package:flutter/material.dart';
import 'package:rakhine_myanmar_translator/configs/configs.dart';
import 'package:rakhine_myanmar_translator/screens/screens.dart';
import 'package:wiredash/wiredash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => LanguageProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final languageProvider = Provider.of<LanguageProvider>(context);
    themeProvider.loadTheme();
    languageProvider.loadLanguage();
    return Consumer2<ThemeProvider, LanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        return Wiredash(
          projectId: DotEnv.wiredashProjectID,
          secret: DotEnv.wiredashSecret,
          theme: WiredashThemeData(primaryColor: themeProvider.primary),
          child: MaterialApp(
            title: languageProvider.rkLang,
            theme: ThemeData(
              useMaterial3: true,
              fontFamily: 'Inder',
              primaryColor: themeProvider.primary,
              appBarTheme: AppBarTheme(backgroundColor: themeProvider.scaffold),
              scaffoldBackgroundColor: themeProvider.scaffold,
              colorScheme: ColorScheme.fromSeed(
                seedColor: themeProvider.primary,
                secondary: themeProvider.primary,
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
      },
    );
  }
}
