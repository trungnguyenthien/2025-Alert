import 'package:alert_2025/presentation/screens/my_home_page.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    /// 🔹 Called when the app starts for the first time.
    /// Example: When the user launches the app from the home screen.
    onStartApp();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    /// 🔹 Called when the app is closed.
    /// Example: When the user swipes up to remove the app from recent apps.
    onCloseApp();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:

        /// 🔹 Called when the app comes to the foreground.
        /// Example: When the user switches back to the app from another app.
        onForeground();
        break;
      case AppLifecycleState.paused:

        /// 🔹 Called when the app goes to the background.
        /// Example: When the user presses the home button or switches to another app.
        onBackground();
        break;
      case AppLifecycleState.inactive:

        /// 🔹 Called when the app is temporarily inactive.
        /// Example: When the user gets a phone call or opens the app switcher.
        onDeactive();
        break;
      case AppLifecycleState.hidden:

        /// 🔹 (Only on Android) Called when the app is hidden (for example, Picture-in-Picture mode).
        break;
      case AppLifecycleState.detached:
        onDetached();
        throw UnimplementedError();
    }
  }

  void onDetached() {
    debugPrint("🔴 App onDetached");
  }

  /// 🚀 Called when the app starts for the first time.
  void onStartApp() {
    debugPrint("🟢 App started for the first time");
  }

  /// 🛑 Called when the app is closed.
  void onCloseApp() {
    debugPrint("🔴 App is closing");
  }

  /// 🔄 Called when the app goes to the background.
  void onBackground() {
    debugPrint("🟡 App moved to background");
  }

  /// 🟢 Called when the app comes back to the foreground.
  void onForeground() {
    debugPrint("🟢 App moved to foreground");
  }

  /// ⚠️ Called when the app is inactive (e.g., receiving a phone call).
  void onDeactive() {
    debugPrint("🔵 App is inactive");
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.cyan, // Màu Cyan cho AppBar
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan, // Dùng màu Cyan cho các phần tử khác
        ),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
