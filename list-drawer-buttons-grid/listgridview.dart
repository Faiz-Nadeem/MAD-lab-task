import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabbedGridView(), 
    );
  }
}
class TabbedGridView extends StatefulWidget {
  @override
  _TabbedGridViewState createState() => _TabbedGridViewState();
}

class _TabbedGridViewState extends State<TabbedGridView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat and LGView'),
          backgroundColor: Color.fromARGB(255, 4, 108, 121),
          bottom: TabBar(
            tabs: [
              Tab(text: 'List'),
              Tab(text: 'Grid'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // List View Tab
            ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.safety_check),
                  title: Text('chat $index'),
                  subtitle: Text("Lets chat"),
                );
              },
            ),
            // Grid View Tab
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                return Card(
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}