import 'package:flutter/material.dart';
import 'package:mobprog_form_handling/screens/home_screen.dart';

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _name,
                  decoration: const InputDecoration(
                      labelText: 'Name', hintText: 'Enter your Name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                ),
                // Email Address Field
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                      labelText: 'Email Address',
                      hintText: 'Enter you Email Address'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email Address';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                // Password Field
                TextFormField(
                  obscureText: !_passwordVisible,
                  controller: _password,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter password',
                      suffixIcon: IconButton(
                          onPressed: () => setState(() {
                                _passwordVisible = !_passwordVisible;
                              }),
                          icon: Icon(_passwordVisible
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined))),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Button to print these shzz
                ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(name: _name.text),
                        ),
                      );
                  },
                  child: const Text("Sign in"),
                )
              ],
            )));
  }
}
