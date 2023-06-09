import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/scan_model.dart';

launchURL( BuildContext context, ScanModel scan  ) async {

  final url = Uri.parse(scan.valor);

  if ( scan.tipo == 'http' ) {
    // Abrir el sitio web
    if(!await launchUrl(url)){
      throw 'Could not launch $url';
    }

  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan );
  }

}