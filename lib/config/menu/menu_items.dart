import 'package:flutter/material.dart';

class MenuItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String link;

  const MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.link,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    icon: Icons.person_outline,
    title: 'Acceso invitado personal',
    subtitle: 'Registra a tus amigos familia o conocidos',
    link: '/invitados',
  ),
  MenuItem(
    icon: Icons.how_to_vote_outlined,
    title: 'Acceso a personal del hogar',
    subtitle: 'Registra una empleada domestica niniera,chofer u otros',
    link: '/',
  ),
  MenuItem(
    icon: Icons.format_paint,
    title: 'Acceso a proveedor / mantenimiento',
    subtitle: 'Registra proveedores de servicios del hogar o condominio',
    link: '/',
  ),
  MenuItem(
    icon: Icons.book_sharp,
    title: 'Mi historial de visitas',
    subtitle: 'Revisa los accesos autorizados',
    link: '/',
  ),
];
