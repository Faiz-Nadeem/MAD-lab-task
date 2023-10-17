import 'package:flutter/material.dart';
import 'package:flutter_application_2/details.dart';

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:const  Text("My Home Page"),
    ),
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hello"),
          FloatingActionButton(onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: ((context) => const details()))
          );
          })
        ],
      ),
     ),
    );
  }

}