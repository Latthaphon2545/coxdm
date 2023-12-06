import 'dart:math';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:coxdm/model/profile.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWidget(text: 'Email'),
                  TextFormField(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Please enter email'),
                      EmailValidator(errorText: 'Please enter a valid email'),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) {
                      profile.email = value!;
                    },
                  ),
                  const SizedBox(height: 40),
                  const TitleWidget(text: 'Password'),
                  TextFormField(
                    controller: _passwordController,
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Please enter password'),
                      MinLengthValidator(8,
                          errorText: 'password must be at least 8 digits long'),
                    ]),
                    obscureText: true,
                    onSaved: (String? value) {
                      profile.password = value!;
                    },
                  ),
                  const SizedBox(height: 40),
                  const TitleWidget(text: 'Confirm Password'),
                  TextFormField(
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      else if (value!.isEmpty) {
                        return 'Please enter confirm password';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print(
                              'Email: ${profile.email} Password: ${profile.password}');
                          formKey.currentState!.reset();
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final String text;

  const TitleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        textBaseline: TextBaseline.alphabetic,
      ),
    );
  }
}
