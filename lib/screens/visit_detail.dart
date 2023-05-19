import 'package:flutter/material.dart';

import 'package:neivor_tecnico/screens/screens.dart';
import 'package:neivor_tecnico/screens/widget/formularios/custom_appbar.dart';

class VisitDetail extends StatelessWidget {
  static const String name = 'visit_detail';

  final Map<String, dynamic>? resForm;

  const VisitDetail({super.key, this.resForm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
              const Column(
                children: [
                  Text(
                    'Detalle de la visita',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Card(
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Visita',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Nombre:',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text('${resForm?["name"]}',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Tipo de visita:',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text('${resForm?["isVarios"]}',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 350,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detalle',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.edit)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Residencia que autoriza:',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text('Martin Gutierrez',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fecha de creacion:',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            Text('23/03/2023',
                                style: TextStyle(fontWeight: FontWeight.w300)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Dia de entrada',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        Text('${resForm?["dias"]}',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Container(
                  padding: EdgeInsets.only(left: 9, top: 16),
                  child: Column(
                    children: [
                      Text('Instrucciones al personal',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: Text('${resForm?['instrucciones']}',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(350, 40),
                        backgroundColor: Colors.deepPurple),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QrScreen(
                                    resForm: resForm,
                                  )));
                    },
                    child: const Text('Crear acceso')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
