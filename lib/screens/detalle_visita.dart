import 'package:flutter/material.dart';
import 'package:neivor_tecnico/screens/widget/formularios/custom_appbar.dart';

class DetalleVisita extends StatelessWidget {
  static const String name = 'detalle_visita';

  const DetalleVisita({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppbar(),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
          Text(
            'Detalle de la visita',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20)),
              Text(
                'Visita',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Nombre'),
                    Text('Tipo de visita'),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('Favoritos'),
                  Icon(Icons.favorite),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Detalle',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.edit)
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('Residencia que autoriza'),
                    Text('Fecha de creacion'),
                    Text('Dia de entrada'),
                    Text('intrucciones al personal'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
