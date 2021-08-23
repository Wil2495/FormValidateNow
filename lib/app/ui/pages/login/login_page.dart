import 'package:flutter/material.dart';
import 'package:form_validate_now/app/ui/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, Register),
                    child: const Text("Register"))
              ],
            )),
      ),
    );
  }
}
