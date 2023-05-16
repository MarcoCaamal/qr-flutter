import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_app/src/provider/ui_provider.dart';

class CustomNavigatorBar extends StatelessWidget {
  const CustomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      elevation: 0,
      currentIndex: uiProvider.selectedMenuOpt,
      onTap: (index) => uiProvider.selectedMenuOpt = index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones'
        )
      ],
    );
  }
}