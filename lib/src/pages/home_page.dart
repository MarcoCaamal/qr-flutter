import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_app/src/pages/direcciones_page.dart';
import 'package:qr_reader_app/src/provider/scan_list_provider.dart';
import 'package:qr_reader_app/src/provider/ui_provider.dart';
import 'package:qr_reader_app/src/widget/custom_navigatorbar.dart';
import 'package:qr_reader_app/src/widget/scan_bottom.dart';

import 'mapas_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () => scanListProvider.borrarTodos(),
            icon: const Icon(Icons.delete))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigatorBar(),
      floatingActionButton: const ScanBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);



    switch(uiProvider.selectedMenuOpt) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return const MapasPage();
      case 1:
      scanListProvider.cargarScanPorTipo('http');
        return const DireccionesPage();

      default:
        return const MapasPage();
    }
  }
}