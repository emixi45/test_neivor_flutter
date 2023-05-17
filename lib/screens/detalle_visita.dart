import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neivor_tecnico/screens/widget/formularios/custom_appbar.dart';

class DetalleVisita extends StatelessWidget {
  static const String name = 'detalle_visita';

  const DetalleVisita({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
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
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nombre:',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('Claudia Morales',
                        style: TextStyle(fontWeight: FontWeight.w300)),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tipo de visita:',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    Text('Invitado especial',
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
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text('Dia de entrada',
                    style: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Container(
              padding: EdgeInsets.only(left: 9, top: 16),
              child: Text('Instrucciones al personal',
                  style: TextStyle(fontWeight: FontWeight.w500)),
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
                  context.push('/qrScreen');
                },
                child: const Text('Crear acceso')),
          ),
        ],
      ),
    );
  }
}
