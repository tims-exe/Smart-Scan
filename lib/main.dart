import 'package:flutter/material.dart';
import 'package:smart_scan/scan.dart';
/* import 'package:text_recognition_flutter/result_screen.dart'; */

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Scan'),
      ),
      body: Center(
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(0, 102, 51, 1)),
            foregroundColor: WidgetStatePropertyAll(Colors.white) 
          ),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const SmartScan())
            );
          },
          child: const Text('Open Camera'),
        )
      ),
    );
  }
}


/* class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  bool _isPermissionGranted = false;

  late final Future<void> _future;

  CameraController? _cameraController;

  final _textRecognizer = TextRecognizer();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); 

    _future = _requestCameraPermission();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopCamera();
    _textRecognizer.close();
    super.dispose();
  }

  @override
  void didChangeAppLifeCycle(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      _stopCamera();
    }
    else if (state == AppLifecycleState.resumed &&
      _cameraController != null &&
      _cameraController!.value.isInitialized) {
        _startCamera();
      }
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Stack(
          children: [
            // show the camera feed behind everything
            if (_isPermissionGranted)
              FutureBuilder<List<CameraDescription>>(
                future: availableCameras(), 
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _initCameraController(snapshot.data!);

                    return Center(child: CameraPreview(_cameraController!));
                  } else {
                    return const LinearProgressIndicator();
                  }
                }
              ),
              Scaffold(
                appBar: AppBar(
                  title: const Text('Sample'),
                ),
                backgroundColor: _isPermissionGranted ? Colors.transparent : null,
                body: _isPermissionGranted ?
                  Column(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: _scanImage,
                            child: const Text('Scan'),
                          ),
                        ),
                      )
                    ],
                  ) : Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: const Text('Camers Permission Denied',
                        textAlign: TextAlign.center,),
                    ),
                  )
              ),
          ],
        );
      }
    );
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }

  void _startCamera() {
    if (_cameraController != null) {
      _cameraSelected(_cameraController!.description);
    }
  }

  void _stopCamera() {
    if (_cameraController != null) {
      _cameraController?.dispose();
    }
  }

  void _initCameraController(List<CameraDescription> cameras){
    if (_cameraController != null) {
      return;
    }

    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++){
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back){
        camera = current;
        break;
      }
    }
    if (camera != null){
      _cameraSelected(camera);
    }
  }

  Future<void> _cameraSelected(CameraDescription camera) async {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _cameraController?.initialize();

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  Future<void> _scanImage() async {
    if (_cameraController == null) return;

    final navigator = Navigator.of(context);

    try{
      final pictureFile = await _cameraController!.takePicture();

      final file = File(pictureFile.path);

      final inputImage = InputImage.fromFile(file);
      final recognizedText = await _textRecognizer.processImage(inputImage);

      await navigator.push(
        MaterialPageRoute(builder: (context) => ResultScreen(text: recognizedText.text),),
      );
    }
    catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An Error Occured'))
      );
    }
  }
}
 */




/*
return 
 */