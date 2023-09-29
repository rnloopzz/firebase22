

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void getProductos() async {
    CollectionReference collectionReference = 
    FirebaseFirestore.instance.collection("tb_productos");
    QuerySnapshot mensajes = await collectionReference.get();
    if (mensajes.docs.length != 0) {
      for (var doc in mensajes.docs) {
        print(doc.data());
        
      }
      
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(children: [
          Text("testing firebase")

        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductos();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

