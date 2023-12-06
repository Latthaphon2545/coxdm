import 'package:flutter/material.dart';
import 'package:coxdm/screen/register.dart';

class LoginSreen extends StatefulWidget {
  const LoginSreen({super.key});

  @override
  State<LoginSreen> createState() => _LoginSreenState();
}

class _LoginSreenState extends State<LoginSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        child: Column(
          children: [
            const Text('Login'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return RegisterScreen();
                }));
              },
              child: const Text('Register'),
            ),
          ],
        )
      ),
    );
  }
}
