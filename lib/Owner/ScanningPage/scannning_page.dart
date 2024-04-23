import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../Scanned_Page/scanned_page.dart';

class QR_Scanner extends StatefulWidget {
  const QR_Scanner({super.key});

  @override
  State<QR_Scanner> createState() => _QR_ScannerState();
}

class _QR_ScannerState extends State<QR_Scanner> {
  String qrResult = 'Scanned Data Will Appear Here ';
  Future<void>ScanQR()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true,ScanMode.QR );
      if(!mounted)return;
      setState(() {
        this.qrResult = qrCode;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ScannedDataDisplayScreen(scannedData:qrResult ,)));

    }on PlatformException{
      qrResult = 'Fail to read Qr Code';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('${qrResult}',style: TextStyle(color: Colors.brown),),
            SizedBox(height: 30,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                onPressed: ScanQR, child: Text('Scan Code',style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}