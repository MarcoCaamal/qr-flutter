import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_app/src/pages/home_page.dart';
import 'package:qr_reader_app/src/pages/mapa_page.dart';
import 'package:qr_reader_app/src/color_schemes.dart';
import 'package:qr_reader_app/src/provider/scan_list_provider.dart';
import 'package:qr_reader_app/src/provider/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => UiProvider()),
        ChangeNotifierProvider(create: ( _ ) => ScanListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => const HomePage(),
          'mapa': ( _ ) => const MapaPage()
        },
        theme: ThemeData(colorScheme: darkColorScheme),
      ),
    );
  }
}