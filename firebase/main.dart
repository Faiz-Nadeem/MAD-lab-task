import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/authservice.dart';
import 'package:firebase/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController ec = TextEditingController();
  TextEditingController pc = TextEditingController();
  TextEditingController namec = TextEditingController();
  TextEditingController agec = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  signUp() async {
    final AuthService authService = AuthService();
    String info = (await authService.signUp(ec.text, pc.text)) as String;
    users.add({
      "name": namec.text,
      "age": agec.text,
      "email": ec.text,
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
  }

  edituser(String docid) {
    users.doc(docid).update({
      "name": namec.text,
      "age": agec.text,
      "email": ec.text,
    });
  }
  deluser(String docid) {
    users.doc(docid).delete();
  }

  signIn() async {
    final AuthService authService = AuthService();
    String info = (await authService.signIn(ec.text, pc.text)) as String;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "name"),
              controller: namec,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Age"),
              controller: agec,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Email"),
              controller: ec,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Password"),
              controller: pc,
              obscureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: signUp,
              child: const Text("Sign Up"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: signIn,
              child: const Text("Sign In"),
            ),

            
            // ElevatedButton(
            //   onPressed: edituser(),
            //   child: const Text("edit"),
            // ),
            // ElevatedButton(
            //   onPressed: deluser(),
            //   child: const Text("edit"),
            // ),

            StreamBuilder(stream:users.snapshots() , builder: (context,Snapshot){
              List<QueryDocumentSnapshot> userlist=Snapshot.data!.docs;
              return Expanded(child:ListView.builder(itemCount: userlist.length,itemBuilder:(context,index){
                      
                      String id=userlist[index].id;
                       return ListTile(title: Text(userlist[index]["name"]),subtitle: Text(userlist[index]["email"]),);
              } ));
            },),
          ],
        ),
      ),
    );
  }
}
