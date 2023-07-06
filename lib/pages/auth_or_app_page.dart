import 'package:flutter/material.dart';
import '../core/models/app_user.dart';
import '../core/services/auth_service.dart';
import 'auth_page.dart';
import 'home_page.dart';
import 'loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AppUser?>(
        stream: AuthService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            print(snapshot.data);
            return snapshot.hasData ? const HomePage() : const AuthPage();
          }
        },
      ),
    );
  }
}
