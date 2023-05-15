import 'package:go_router/go_router.dart';
import 'package:neivor_tecnico/screens/screens.dart';




final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name:HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/invitadosScreen',
      name:InvitadosScreen.name,
      builder: (context, state) => const InvitadosScreen()),
    
  ]
  
  
  );