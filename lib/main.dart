import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'core/routes/routes.dart';
import 'locator.dart';

// void usePathUrlStrategy() {
//   setUrlStrategy(PathUrlStrategy());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().router,
      debugShowCheckedModeBanner: false,
    );
  }
}
