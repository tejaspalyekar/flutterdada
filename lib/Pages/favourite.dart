import 'package:flutter/material.dart';
import 'package:flutterdada/Provider/Items.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _CartState();
}

class _CartState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text(
            "Favourite",
            style: TextStyle(fontSize: 28),
          ),
          Consumer<Items>(
            builder: (context, value, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: value.fav.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: SizedBox(
                          width: 100,
                          height: 200,
                          child: Image.network(
                            value.fav[index][2],
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(value.fav[index][0]),
                        subtitle: Text(
                          value.fav[index][1],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              Provider.of<Items>(context,listen: false).removeFav(value.fav[index][0]);
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
