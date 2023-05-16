import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader_app/src/utils/utils.dart';

import '../provider/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return ListView.builder(
      itemBuilder: (_, i) {
        return Dismissible(
          key: ValueKey<int>(scanListProvider.scans[i].id),
          background: Container(color: Colors.red,),
          onDismissed: (direction) {
            scanListProvider.borrarScanPorId(scanListProvider.scans[i].id);
          },
          child: ListTile(
            leading: Icon(tipo == 'http' ? Icons.find_in_page : Icons.map),
            title: Text(scanListProvider.scans[i].valor),
            subtitle: Text('ID: ${scanListProvider.scans[i].id}'),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () => launchURL(context, scanListProvider.scans[i]),
            // onTap: () {},
          ),
        );
      },
      itemCount: scanListProvider.scans.length,
    );
  }
}