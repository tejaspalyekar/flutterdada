import 'package:flutter/material.dart';

class Items extends ChangeNotifier {
  List<List<dynamic>> ItemList = [
    [
      'Nike Air Force 1',
      'The hidden Nike Air units and durable, era-echoing 80s construction add the comfort you know and love',
      'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0960cd04-9f9f-46b5-af76-63118f9c48b6/air-force-1-07-shoes-cg0zlX.png',
      '2000'
    ],
    [
      'Nike Waffle Debut SE',
      'Retro running style gets modernised in this special-edition Nike Waffle Debut. Era-echoing suede and nylon are paired with a modern wedge-shaped midsole for a look that feels fresh and classic.',
      'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/6b624fcc-7810-4644-9a51-40a65ca1a5d5/waffle-debut-se-shoes-zPhTV5.png',
      '3500'
    ],
    [
      'Nike Air Humara',
      'The Air Humara sets you up with vintage ACG aesthetics and Nike trail running DNA. Made from quality materials with a whole lot of outdoor appeal, everything about this shoe encapsulates the 90s zeitgeist.',
      'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/12a4582a-31e3-4438-b9f1-1aec9991314a/air-humara-shoes-cMxm2B.png',
      '4000'
    ]
  ];

  List<List<dynamic>> fav = [];
  List<List<dynamic>> cart = [];
  List<String> favtitle = [];
  Map<String, int> carttitle = {};

  var cartTotal = 0;

  get itemlist => ItemList;
  get favitems => fav;
  get cartItems => cart;
  get total => cartTotal;

  void addCartItem(idx) {
    if (!carttitle.containsKey(itemlist[idx][0])) {
      cart.add(ItemList[idx]);
      carttitle.addAll({ItemList[idx][0]: 1});
      cartTotal = cartTotal + int.parse(ItemList[idx][3]);
    } else {
      int? count = carttitle[ItemList[idx][0]]! + 1;
      carttitle.update(ItemList[idx][0], (value) => count);
      cartTotal = cartTotal + int.parse(ItemList[idx][3]);
    }
    notifyListeners();
  }

  void removeCartItem(title) {
    for (int i = 0; i < carttitle.length; i++) {
      if (cart[i][0] == title) {
        cartTotal = cartTotal - int.parse(cart[i][3]);
        int? count = carttitle[ItemList[i][0]]!;
        if (count < 2) {
          carttitle.remove(title);
          cart.removeAt(i);
        } else {
          count = count-1;
            carttitle.update(ItemList[i][0], (value) => count!);
        }
      }
    }
    notifyListeners();
  }

  void addFav(idx) {
    fav.add(ItemList[idx]);
    favtitle.add(ItemList[idx][0]);
    notifyListeners();
  }

  void removeFav(title) {
    for (int i = 0; i < fav.length; i++) {
      if (fav[i][0] == title) {
        favtitle.remove(title);
        fav.removeAt(i);
      }
    }
    notifyListeners();
  }
}
