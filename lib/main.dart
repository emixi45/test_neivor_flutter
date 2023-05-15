import 'package:flutter/material.dart';
import 'package:neivor_tecnico/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      
      routerConfig: appRouter,
    );
    
  }
}
