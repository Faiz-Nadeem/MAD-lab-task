// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
        
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

 
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//  TextEditingController usernameController =TextEditingController();
//  TextEditingController passwordController =TextEditingController();


//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
//       title: const Text("Form Example"),
//       ),
//       body: Form(
//         key: formKey,     
//         child: Column(
//           children: [
//             TextFormField(
//               controller: usernameController,
//               decoration: const InputDecoration(labelText: ("Username"),
//             border: OutlineInputBorder(),
//             hintText: "Name please"
//           ),
//           validator: (String? value) {
//             if(value!.isEmpty){
//               return "Please type anything";
//             } 
//             return null;
//           },
//             ),
//             TextFormField(
//              controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(labelText: ("Password"),
//             border: OutlineInputBorder(),
//             hintText: "Password"
//           ),
          
//           validator: (String? value) {
//            RegExp regex =
//         RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
//     if (value!.isEmpty) {
//       return 'Please enter password';
//     } else {
//       if (!regex.hasMatch(value)) {
//         return 'Enter valid password';
//       } else {
//         return null;
//       }
//       }
//           },
//             ),

//             ElevatedButton(onPressed: (){
//               if (formKey.currentState!.validate()){ // ! this sign is used to accept null values.
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text("Form Submitted: ${usernameController.text} & password: ${passwordController.text}")
//                   )
//                 );
//               }
//             },
//              child: const Text("Submit")
//             )
//           ],
//       ),
      
//     )
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'Page1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Page1(),
    );
  }
}