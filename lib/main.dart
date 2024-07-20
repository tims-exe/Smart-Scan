import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Scan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isPermissionGranted = false;

  late final Future<void> _future;

  @override
  void initState() {
    super.initState();

    _future = _requestCameraPermission();
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sample'),
          ),
          body: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Text(
                _isPermissionGranted
                ? 'Camera Permission granted'
                : 'Camera Permission Denied',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }
    );
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }
}