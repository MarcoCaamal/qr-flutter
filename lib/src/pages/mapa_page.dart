import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/scan_model.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> controller1 = Completer<GoogleMapController>();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)?.settings.arguments as ScanModel;
    // Marcadores
    Set<Marker> markers = <Marker>{};
    markers.add( Marker(
      markerId: const MarkerId('geo-location'),
      position: scan.getLatLng()
      )
    );

    final puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 17.5,
    tilt: 50
  );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await controller1.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(puntoInicial));
            }, 
            icon: const Icon(Icons.location_disabled)
          )
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          controller1.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          if(mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else {
            mapType = MapType.normal;
          }
          setState(() {
            
          });
        },
        child: const Icon(Icons.layers),
      ),
    );
  }
}
