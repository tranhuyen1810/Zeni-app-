import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/app_state.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/create_order_screen.dart';
import 'screens/assistant_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ZeniApp());
}

class ZeniApp extends StatelessWidget {
  const ZeniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState()..initialize(),
      child: MaterialApp(
        title: 'Zeni App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF0052CC),
            secondary: Color(0xFF22C55E),
            surface: Color(0xFFF3F4F6),
          ),
          scaffoldBackgroundColor: const Color(0xFFF3F4F6),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0052CC)),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const LoginScreen(),
          '/dashboard': (_) => const DashboardScreen(),
          '/orders': (_) => const OrdersScreen(),
          '/create_order': (_) => const CreateOrderScreen(),
          '/assistant': (_) => const AssistantScreen(),
        },
      ),
    );
  }
}
