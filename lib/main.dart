import 'package:flutter/material.dart';
import 'package:flutterdada/Pages/CArt.dart';
import 'package:flutterdada/Pages/Home.dart';
import 'package:flutterdada/Pages/favourite.dart';
import 'package:flutterdada/Provider/Items.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
    create: (BuildContext context)=> Items(),
    child: const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes Zone'),
        actions: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(ModalBottomSheetRoute(
                    showDragHandle: true,
                    builder: (context) => const Cart(),
                    isScrollControlled: true));
              },
              icon: const Icon(Icons.shopping_bag),
              iconSize: 30,
              color: Colors.blueGrey[700],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(ModalBottomSheetRoute(
                     showDragHandle: true,
                    builder: (context) => const Favourite(),
                    isScrollControlled: true));
              },
              icon: const Icon(Icons.favorite),
              iconSize: 30,
              color: const Color.fromARGB(255, 85, 97, 102),
            ),
          )
        ],
      ),
      body: const Home(),
    );
  }
}
