import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

import 'package:flutter_svg/svg.dart';
import 'package:metamorphosis/data.dart';
import 'package:metamorphosis/utils/user-check.dart';
import 'package:quickalert/quickalert.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> showResult(rno) async {
    bool exists = await checkExist(removeSpaces(rno), context);
    if (exists) {
      await admitUser(removeSpaces(rno));
      QuickAlert.show(
          text: "Admitted", context: context, type: QuickAlertType.success);
      setState(() {
        scanResult = null;
      });
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'QR Code not valid ',
      );
      setState(() {
        scanResult = null;
      });
    }
  }

  ScanResult? scanResult;

  String dis = "Come on! Scan Something.";

  Future scanQR() async {
    try {
      // bulkAdd(registered);
      ScanResult qrResult = await BarcodeScanner.scan();

      setState(() {
        scanResult = qrResult;
      });
      if (scanResult != null && scanResult!.rawContent != '') {
        // bulkAdd(registered);
        QuickAlert.show(
            context: context,
            barrierDismissible: false,
            type: QuickAlertType.confirm,
            text: 'Admit ${scanResult!.rawContent}',
            confirmBtnText: 'Yes',
            cancelBtnText: 'No',
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () =>
                {showResult(scanResult!.rawContent), Navigator.pop(context)});
      }
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          dis = "Oops! Camera Permission Required.";
        });
      } else {
        setState(() {
          dis = "Ouch, an unknown error! $e";
        });
      }
    } on FormatException catch (e) {
      setState(() {
        dis = "Come On! Scan Something.";
      });
    } catch (e) {
      setState(() {
        dis = "Ouch, an unknown error! $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Center(child: Text("Metamorphosis")),
          backgroundColor: Color(0xff852FF5)),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color(0xff852FF5), boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  color: Color.fromRGBO(189, 189, 189, 1),
                  spreadRadius: 1,
                  offset: Offset(1, 1))
            ]),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                width: MediaQuery.of(context).size.width,
                child: SvgPicture.asset(
                  'assets/magic1.svg',
                )),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, top: 20, bottom: 10),
                    child: Text(
                      "Verify Entry",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: Text(
                          "Get ready for a spellbinding experience. Scan your entry pass and join us.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ))
                ],
              ),
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Transform.scale(
          scale: 1.1,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff852FF5), Color(0xffD91F9D)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: FloatingActionButton.extended(
              backgroundColor: Color.fromARGB(0, 255, 255, 255),
              icon: Icon(Icons.qr_code),
              label: Text("Scan now "),
              onPressed: scanQR,
            ),
          )),
    );
  }
}
