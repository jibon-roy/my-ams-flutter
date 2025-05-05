import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:my_ams/screens/auth/login.dart';
import 'package:my_ams/widgets/global/myAppBar.dart';
// import 'package:my_ams/screens/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: const TextTheme()),
      home: HomePage(),
    );
  }
}

// ------------------- Home Page with AppBar -------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Home"),
      body: const Center(child: Text("Welcome to My AMS")),
    );
  }
}

// ------------------- QR Scanner Page -------------------
class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  bool isScanCompleted = false;

  // Method to handle when a QR is detected
  void _onDetect(BarcodeCapture capture) {
    if (!isScanCompleted) {
      isScanCompleted = true;

      final String? code = capture.barcodes.first.rawValue;
      if (code != null && code.isNotEmpty) {
        Navigator.pop(context); // Go back after scanning
        _showScanResult(context, code);
      }
    }
  }

  // Show the result in a dialog
  void _showScanResult(BuildContext context, String data) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('QR Code Found'),
            content: Text(data),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    ).then((_) {
      // Reset scan status after dialog closed
      isScanCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR Code'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          MobileScanner(onDetect: (capture) => _onDetect(capture)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.5),
              child: const Text(
                "Point your camera at a QR code",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
