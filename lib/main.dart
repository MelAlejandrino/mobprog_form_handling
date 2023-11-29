import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)),
      home: MainPage()
    );
  }
}

class MainPage extends StatelessWidget{
  const MainPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Handling", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8.0), 
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
              const SizedBox(height: 20,),
              FormValidation()
            ]),
          decoration: BoxDecoration(  
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          ),
      ),
    );
  }
}

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Email Address Field
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter you Email Address'
              ),
              validator: (String? value){
                if(value == null || value.isEmpty){
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
                  onPressed: () => setState((){
                    _passwordVisible = !_passwordVisible;
                  }), 
                  icon: Icon(_passwordVisible ? Icons.remove_red_eye : Icons.remove_red_eye_outlined))
              ),
                          validator: (String? value){
                if(value == null || value.isEmpty){
                  return 'Please enter Password';
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 20,),
            // Button to print these shzz
            ElevatedButton(
              onPressed: (){
                print(_email.text);
                print(_password.text);
              },
              child: const Text("Sign in"),
            )
          ],
      )
    ));
  }
}