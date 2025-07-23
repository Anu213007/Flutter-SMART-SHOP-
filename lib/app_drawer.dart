import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 60, // Adjust height as needed
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(''), // Empty text to remove the title
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.black),
            title: const Text('Home', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Colors.black),
            title: const Text('Cart', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.black),
            title: const Text('Favorites', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop(); // Close the drawer
              Navigator.of(context).pushNamed('/favorites');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.black),
            title: const Text('Profile', style: TextStyle(color: Colors.black)),
            onTap: () {
              // Navigate to Profile Screen (create this screen next)
              Navigator.of(context).pop(); // Close the drawer
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile Screen Coming Soon!')),
              );
            },
          ),
          const Divider(color: Colors.black),
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return SwitchListTile(
                title: const Text('Dark Mode', style: TextStyle(color: Colors.black)),
                secondary: const Icon(Icons.brightness_6, color: Colors.black),
                value: themeProvider.currentTheme == ThemeData.dark(),
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.black),
            title: const Text('Logout', style: TextStyle(color: Colors.black)),
            onTap: () async {
              await Provider.of<AuthProvider>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
