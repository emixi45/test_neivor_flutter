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
        leading: const SizedBox(),
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
                  color: Colors.blueGrey[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                      width: 350,
                      height: 500,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'Neivor',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              '${resForm?["name"]}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('torre-101'),
                                Icon(Icons.people),
                                Text('Manuel Sanchez'),
                              ],
                            ),
                          ),
                          const Text(
                              'Francisco javier Clavijero 51,CDmx,mexico'),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: QrImageView(
                              data: '$resForm',
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Entrada:${resForm?["Visita_varios_dias"]}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Text('Expira:${resForm?["Visita_varios_dias"]}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  )),
                              const Text('Queres saber mas sobre neivor?',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                  )),
                              const Padding(
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
              child: const Text('Compartir en WhatsApp'),
            )
          ],
        ),
      ),
    );
  }
}
