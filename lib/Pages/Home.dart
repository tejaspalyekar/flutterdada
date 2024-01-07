import 'package:flutter/material.dart';
import 'package:flutterdada/Provider/Items.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Items>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.ItemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomCard(
                title: value.ItemList[index][0],
                description: value.ItemList[index][1],
                imageUrl: value.ItemList[index][2],
                idx: index,
              ),
            );
          },
        );
      },
    );
  }
}

class CustomCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final int idx;

  CustomCard(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.idx});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  IconData likeicon = Icons.favorite_border_outlined;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: const Color.fromARGB(255, 212, 222, 227),
      shadowColor: const Color.fromARGB(255, 45, 45, 45),
      child: Column(
        children: [
          Image.network(
            widget.imageUrl,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    width: double.infinity,
                    child: Consumer<Items>(
                      builder: (context, value, child) {
                        
                        return value.carttitle.containsKey(widget.title)?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              Provider.of<Items>(context, listen: false)
                                .removeCartItem(value.cart[widget.idx][0]);
                            }, 
                            icon: const Icon(Icons.minimize)),
                            const SizedBox(width: 10,),
                            Text(value.carttitle[widget.title].toString()),
                            const SizedBox(width: 10,),
                            IconButton(onPressed: (){
                               Provider.of<Items>(context, listen: false)
                                .addCartItem(widget.idx);
                            }, icon: const Icon(Icons.add))
                          ],
                        ):
                        TextButton(
                          onPressed: () {
                            Provider.of<Items>(context, listen: false)
                                .addCartItem(widget.idx);
                          },
                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 143, 10, 0)),
                          ));
                      },
                      
                    )),
              ),
              Consumer<Items>(
                builder: (context, value, child) {
                  return IconButton(
                      onPressed: () {
                        print(widget.idx.toString());
                        setState(() {
                          if (value.favtitle.contains(widget.title)) {
                            Provider.of<Items>(context, listen: false)
                                .removeFav(widget.title);
                          } else {
                            Provider.of<Items>(context, listen: false)
                                .addFav(widget.idx);
                          }
                        });

                        print(value.favtitle);
                      },
                      icon: Icon(
                        value.favtitle.contains(widget.title)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: value.favtitle.contains(widget.title)
                            ? Colors.red
                            : const Color.fromARGB(255, 39, 39, 39),
                        size: 35,
                      ));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
