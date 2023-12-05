import 'package:flutter/material.dart';
import 'package:mobprog_form_handling/component/form_validation.dart';

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
          height: MediaQuery.of(context).size.height * 0.6,
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