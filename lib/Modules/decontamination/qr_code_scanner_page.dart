import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/Modules/decontamination/decontamination_widget.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:get/get.dart';
import 'decontamintaion_view_model.dart';

class QRSeannerView extends StatefulWidget {
  const QRSeannerView(
    this.mark, {
    Key key,
  }) : super(key: key);
  final DecontaminationMenuMark mark;
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
        children: <Widget>[
          Container(
            child: _buildQrView(context),
          ),
          _buildFlutterWidget(context),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
    );
  }

  String isValue; // Prevent continuous scanning

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (null != scanData.code  && isValue == null) {
        controller.pauseCamera();
        isValue = scanData.code;
        if (widget.mark == DecontaminationMenuMark.upnRecord) {
          var future = context.read<DecontamintaionViewModel>().getDescroption(context, unp: scanData.code);
          future.then((bool value) {
            if (value == true) {
              Navigator.pop(context);
              controller.dispose();
            }
          }).catchError((error) {
            print(error);
            controller.resumeCamera();
            isValue = null;
          }).whenComplete(() {
            debugPrint("Execution complete");
          });
        }
        if (widget.mark == DecontaminationMenuMark.serialRecord) {
          context.read<DecontamintaionViewModel>().changeModel(context, serial: scanData.code);
          Navigator.pop(context);
          controller.dispose();
        }
        controller.resumeCamera();
      }
    });
  }

  Widget _buildFlutterWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: new BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        border: Border.all(width: 1, color: Color(0xFFAAAAAA)),
      ),
      child: (Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2 - 40,
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20, top: 80),
              child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 80,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              border: Border.all(width: 2.5, color: Color(0xFFAAAAAA)),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Text('Scan code',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
