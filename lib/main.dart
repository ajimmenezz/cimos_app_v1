import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cimos_v1/screens/screens.dart';
import 'package:cimos_v1/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: LoginScreen(),
        routes: {
          '/home': (context) => const HomePageScreen(),
          '/topvideos': (context) => const TopVideos(),
          '/videosdetails': (context) => const VideoDetailsScreen(information: {}),
        },
        theme: ThemeData.light(),
        // Rutas dinamicas
        // onGenerateRoute: AppRoutes.onGenerateRoute,
        // theme: AppTheme.lightTheme,  // Aqui vamos a manejar el
      ),
    );
    // Rutas
  }
}
