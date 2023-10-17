import 'package:flutter/material.dart';
//import 'package:flutter_application_navigation/myhomepage.dart';

import 'myhomepage.dart';
class details extends StatelessWidget{
  
  const details({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(appBar: AppBar(
      title:const  Text("details Page"),
    ),
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hello you are on the new page"),
          FloatingActionButton(onPressed: (){
          Navigator.of(context).pop(
            MaterialPageRoute(builder: ((context) => const MyHomePage()))
          );
          })
        ],
      ),
     ),
    );
  }

}