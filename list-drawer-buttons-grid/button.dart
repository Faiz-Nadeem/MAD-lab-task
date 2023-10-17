import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hello")),
        body: Center(
            child: Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
          const Text("Hello",style: TextStyle(fontFamily: 'RaleWay',fontSize: 50)),
          const Text("Hello"),
          Row(children: [
            ElevatedButton(onPressed: () {}, child: Text("Press ")),
          OutlinedButton(onPressed: () {}, child: Text("Outline"))
          ]
          )
        ])));

    //         child: Text("Hello",
    //             style: Textstyle(fontsize: 35, fontweight: Fontweight.bold)),
    //       ));
    // }
  }
}