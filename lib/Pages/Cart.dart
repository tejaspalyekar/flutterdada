import 'package:flutter/material.dart';
import 'package:flutterdada/Provider/Items.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Items>(
        builder: (context, value, child) {
          return Column(
            children: [
              const Text(
                "Items in cart",
                style: TextStyle(fontSize: 28),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: SizedBox(
                          width: 100,
                          height: 200,
                          child: Image.network(
                            value.cart[index][2],
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(value.cart[index][0]),
                        subtitle: Text('Price: ₹ ${value.cart[index][3]}'),
                        trailing: IconButton(
                            onPressed: () {
                              Provider.of<Items>(context,listen: false).removeCartItem(index);
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    );
                  },
                ),
              ),
              const Column(
                children: [Text("Cart Total")],
              ),
            ],
          );
        },
      ),
    );
  }
}
