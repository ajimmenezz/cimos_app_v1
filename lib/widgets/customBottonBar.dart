import 'package:cimos_v1/theme/cimos_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cimos_v1/providers/ui_provider.dart';

class CustomButtonBar extends StatefulWidget {
  const CustomButtonBar({Key? key}) : super(key: key);

  @override
  State<CustomButtonBar> createState() => _CustomButtonBarState();
}

class _CustomButtonBarState extends State<CustomButtonBar> {
  @override
  Widget build(BuildContext context) {
    // Inicializacion
    final uiProvider = Provider.of<UiProvider>(context);

    // Cambiar para mostrar pagina prespectiva, Get
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) {
        // Set
        uiProvider.selectedMenuOpt = i;

        switch (i) {
          case 0:
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/videosondemand');
            break;
          case 2:
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
      // Style
      currentIndex: currentIndex,
      selectedFontSize: 12,
      selectedItemColor: CimosTheme.primary,
      iconSize: 25,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Videos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
