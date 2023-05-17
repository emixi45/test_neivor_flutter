import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class QrScreen extends StatelessWidget {
  static const String name = 'QrScreen';

  const QrScreen({super.key});

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
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                    width: 350,
                    height: 500,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 70)),
                        const Text(
                          'Neivor',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Alicia Gonzalez',
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
                            data: '1234567890',
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Entrada:',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                )),
                            Text('Expira:',
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(350, 40),
                  backgroundColor: Colors.deepPurple[400]),
              child: const Text('whatsapp'),
              onPressed: () {
                launchUrl(Uri.parse('https://wa.me/1132368155'),
                    mode: LaunchMode.externalApplication);
              },
            )
          ],
        ),
      ),
    );
  }
}


// class _whatsapp extends StatelessWidget {
//   const _whatsapp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
