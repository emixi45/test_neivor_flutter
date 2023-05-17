import 'package:go_router/go_router.dart';
import 'package:neivor_tecnico/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/invitados',
      name: InvitadosScreen.name,
      builder: (context, state) => const InvitadosScreen()),
  GoRoute(
      path: '/detalle_invitados',
      name: DetalleVisita.name,
      builder: (context, state) => const DetalleVisita()),
  GoRoute(
      path: '/QrScreen',
      name: QrScreen.name,
      builder: (context, state) => const QrScreen()),
]);
