import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'all_provider.dart';

class DarkThemeScreen extends StatelessWidget {
  const DarkThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light Mode"),
            value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged:themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged:themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System Mode"),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged:themeChanger.setTheme,
          ),
          Icon(Icons.favorite),
          Text("Hello"),
          Container(
            width: 100,
            height: 100,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
