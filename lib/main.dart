import 'package:material_ui/material_ui.dart';

import 'halaman_menu.dart';

void main() => runApp(const MenuUmkmApp());

/// Satu-satunya warna yang ditulis langsung; warna lain dibaca dari tema.
const Color warnaDasar = Color(0xFFB3541E);

class MenuUmkmApp extends StatelessWidget {
  const MenuUmkmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kedai Soto Kesawan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: warnaDasar),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: warnaDasar,
          brightness: Brightness.dark,
        ),
      ),
      home: const HalamanMenu(),
    );
  }
}
