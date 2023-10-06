import 'package:eval_sis22/pages/sobrenosotros.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(const MyApp());
} 
//Yordy

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firestore Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Firestore Demo'),
    );
  }
}
//rene
  

 class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> dataFromFirestore = [];
  TextEditingController nombreController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController precioController =
      TextEditingController(); // Agregado para el precio

  void getChat() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("tb_productos");
    QuerySnapshot mensajes = await collectionReference.get();
    if (mensajes.docs.isNotEmpty) {
      setState(() {
        dataFromFirestore.clear();
      });

      for (var doc in mensajes.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if (kDebugMode) {
          print(data);
        }
        setState(() {
          dataFromFirestore.add(data);
        });
      }
    }
  }

  //Yordy




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

