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
                        subtitle: Text(
                            'Price: ₹ ${int.parse(value.cart[index][3]) * value.carttitle[value.cart[index][0]]!}\nQty: ${value.carttitle[value.cart[index][0]]}'),
                        trailing: IconButton(
                            onPressed: () {
                              Provider.of<Items>(context, listen: false)
                                  .removeCartItem(value.cart[index][0]);
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text(
                      "Cart Total",
                      style: TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: value.cart.length.toDouble() * 30,
                      child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                value.cart[index][0],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '₹ ${int.parse(value.cart[index][3])} x ${value.carttitle[value.cart[index][0]]}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const Divider(
                      indent: 20,
                      endIndent: 20,
                      color: Color.fromARGB(255, 63, 63, 63),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Total: ",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹ ${value.cartTotal}',
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Check Out",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 165, 19, 9)),
                            )))
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
