import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_provider.dart';
import 'cart_provider.dart';
import 'pro.dart';
import 'theme.dart';
import 'splash_screen.dart';
import 'login.dart';
import 'home_screen.dart';
import 'cart.dart';
import 'favorites_screen.dart';
import 'register.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Smart Shop',
          theme: themeProvider.currentTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const LoginScreen(),
            '/home': (context) => const HomeScreen(),
            '/cart': (context) => const CartScreen(),
            '/favorites': (context) => const FavoritesScreen(),
            '/register': (context) => const RegisterScreen(),
          },
        );
      },
    );
  }
}