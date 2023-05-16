import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_app/src/provider/scan_list_provider.dart';

class ScanBottom extends StatelessWidget {
  const ScanBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    return FloatingActionButton(
      onPressed: () async {
        // const String result = 'https://flutter.dev/';
        // const String result = 'geo:19.576053,-88.051157';
        final String result = await FlutterBarcodeScanner.scanBarcode('#4D8BEF', 'CANCELAR', true, ScanMode.QR);

        if(result == '-1') {
          return;
        }

        scanListProvider.nuevoScan(result);
        // scanListProvider.nuevoScan('geo:15.33,15.66');
      },
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
