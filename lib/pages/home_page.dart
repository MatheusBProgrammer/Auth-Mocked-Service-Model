import 'package:flutter/material.dart';

import '../core/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ChatApp'),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            DropdownButton(
              underline: Container(),
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              items: [
                DropdownMenuItem(
                  //the value connected to this item is identify in the onChanged
                  value: 'logout',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.black87,
                      ),
                      Text('Sair'),
                    ],
                  ),
                )
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            )
          ],
        ),
        body: SafeArea(
          child: Center(child: Text('App')),
        ));
  }
}
