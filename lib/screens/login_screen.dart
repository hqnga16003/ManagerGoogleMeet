import 'package:async_button_builder/async_button_builder.dart';
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
        child: AsyncButtonBuilder(
          loadingWidget: const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: 16.0,
              width: 16.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
          successWidget: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.check,
              color: Colors.purpleAccent,
            ),
          ),
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
          loadingSwitchInCurve: Curves.bounceInOut,
          loadingTransitionBuilder: (child, animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1.0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: child,
            );
          },
          builder: (context, child, callback, state) {
            return Material(
              color: state.maybeWhen(
                success: () => Colors.purple[100],
                orElse: () => Colors.blue,
              ),
              // This prevents the loading indicator showing below the
              // button
              clipBehavior: Clip.hardEdge,
              shape: const StadiumBorder(),
              child: InkWell(
                onTap: callback,
                child: child,
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              'Click Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
// await GoogleAuthentication.signInWithGoogle(context: context)
//     .then((value) {
// if (value != null) {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => const DashboardScreen(),
// ));
// } else {
// debugPrint('something went wrong while login...');
// }
// });
// }
