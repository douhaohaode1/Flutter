import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import 'decontamintaion_view_model.dart';

class QRSeannerView extends StatefulWidget {

  const QRSeannerView(this.mark,{
    Key key,
  }) : super(key: key);
  final String mark;

  @override
  State<StatefulWidget> createState() => _QRSeannerViewState();
}

class _QRSeannerViewState extends State<QRSeannerView> {

  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    } else if (Platform.isIOS) {
      controller.resumeCamera();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: const Alignment(-0.9, - 0.85),
        children:
        <Widget>[
          Container(child:  Consumer<DecontamintaionViewModel>(
            builder: (ctx, decontamintaionVM, child) {
              return  _buildQrView(context);
             },
          ),
         ),
          Container(
            width: 50,
            height: 40,
            child:  IconButton(
                icon: Icon(Icons.arrow_back_outlined,color: Colors.white,),
                onPressed: (){
                  Navigator.pop(context);
              }
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    //var scanArea = (MediaQuery.of(context).size.width < 400 ||
      //  MediaQuery.of(context).size.height < 400)
      //  ? 180.0
      //  : 350.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return  QRView(
      key: qrKey,
     // cameraFacing: CameraFacing.back,
      onQRViewCreated: _onQRViewCreated,
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData)  {
      print(scanData.code);
      if (null !=scanData.code ) {
        if (widget.mark == 'upn'){
          context.read<DecontamintaionViewModel>().getDescroption(context,unp:scanData.code);
          context.read<DecontamintaionViewModel>().changeModel(context,upn: scanData.code);
        }
        if (widget.mark == 'serial') {
          context.read<DecontamintaionViewModel>().changeModel(context,serial: scanData.code);
        }
        controller.pauseCamera();
        Navigator.pop(context);
        controller.dispose();
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
