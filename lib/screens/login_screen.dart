import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manager_google_meet/google_authentication.dart';

import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          key: UniqueKey(),
          onPressed: () async {
            await GoogleAuthentication.signInWithGoogle(context: context)
                .then((value) {
              if (value != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ));
              } else {
                debugPrint('something went wrong while login...');
              }
            });
          },
          child: const Text("click"),
        ),
      ),
    );
  }
}