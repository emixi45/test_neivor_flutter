import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class QrScreen extends StatelessWidget {
  static String name = 'QrScreen';
  final Map<String, dynamic>? resForm;
  final controller = ScreenshotController();
  QrScreen({super.key, this.resForm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              )),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(bottom: 60)),
            Screenshot(
              controller: controller,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                      width: 350,
                      height: 500,
                      child: Column(
                        children: [
                          const Text(
                            'Neivor',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${resForm?["name"]}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('torre-101'),
                                Icon(Icons.people),
                                Text('Manuel Sanchez'),
                              ],
                            ),
                          ),
                          Text('Francisco javier Clavijero 51,CDmx,mexico'),
                          Container(
                            child: QrImageView(
                              data: '${resForm}',
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Entrada:${resForm?["dias"]}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text('Expira:${resForm?["dias"]}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text('Queres saber mas sobre neivor?',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text('www.Neivor.com',
                                    style: TextStyle(
                                      color: Colors.deepPurpleAccent,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ))),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(350, 40),
                  backgroundColor: Colors.deepPurple),
              onPressed: () async {
                Uint8List? capturedImage = await controller.capture();

                await Share.file(
                  'Captura de pantalla',
                  'captura.png',
                  capturedImage as List<int>,
                  'image/png',
                  text: '¡Qr!',
                );
              },
              child: Text('Compartir en WhatsApp'),
            )
          ],
        ),
      ),
    );
  }
}
  
// Future saveAndShare(Uint8List bytes) async {
//     final directory = await getApplicationDocumentsDirectory();
//     final image = File('${directory.path}/flutter.png');
//     image.writeAsBytesSync(bytes);
//     final text = 'enviar por whatsapp';
//     await Share.files(image);
//   }




// launchUrl(Uri.parse('https://wa.me/${resForm?["celular"]}'),
//                     mode: LaunchMode.externalApplication);

// Future<String> saveImage(Uint8List bytes) async {
  //   await [Permission.storage].request();
  //   final time = DateTime.now()
  //       .toIso8601String()
  //       .replaceAll('.', '-')
  //       .replaceAll(':', '-');

  //   final name = 'screenshot_$time';
  //   final result = await ImageGallerySaver.saveImage(bytes, name: name);
  //   return result['filePath'];
  // 