import 'package:go_router/go_router.dart';
import 'package:neivor_tecnico/screens/screens.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      path: '/guests_screen',
      name: GuestsScreen.name,
      builder: (context, state) => const GuestsScreen()),
  GoRoute(
      path: '/QrScreen',
      name: QrScreen.name,
      builder: (context, state) => QrScreen()),
  GoRoute(
      path: '/visit_detail',
      name: VisitDetail.name,
      builder: (context, state) => const VisitDetail()),
]);
