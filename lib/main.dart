import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cimos_v1/screens/screens.dart';
import 'package:cimos_v1/providers/ui_provider.dart';

import 'package:cimos_v1/theme/cimos_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token').toString();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: token == null ? const LoginScreen() : const HomePageScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomePageScreen(),
          '/videosondemand': (context) => const VideosOnDemand(),
          '/profile': (context) => const ProfilePageScreen(),
          '/videosdetails': (context) =>
              const VideoDetailsScreen(information: {}),
        },
        theme: CimosTheme.lightTheme,
      ),
    ));
  });
}

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Material App',
//         home: LoginScreen(),
//         routes: {
//           '/login': (context) => const LoginScreen(),
//           '/home': (context) => const HomePageScreen(),
//           '/topvideos': (context) => const VideosOnDemand(),
//           '/videosdetails': (context) =>
//               const VideoDetailsScreen(information: {}),
//         },
//         theme: CimosTheme.lightTheme,
//       ),
//     );
//     // Rutas
//   }
// }
