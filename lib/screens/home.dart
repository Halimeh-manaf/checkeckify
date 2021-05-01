import 'dart:async';
import 'package:checkify/model/item_model.dart';
import 'package:checkify/widgets/header.dart';
import 'package:checkify/widgets/items_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  //final List<ItemModel> itemsList = [ ItemModel(title: "Ebay", trailing: Icons.check, isAvailable: false), ];
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemsList itemsList = ItemsList();
  Timer timer;

  @override
  void initState() {
    super.initState();
    itemsList.addItem(ItemModel(
        title: "GameStop PS5",
        url1: 'https://www.gamestop.de',
        url2: '/PS5/Games/58665'));

    itemsList.addItem(ItemModel(
        title: "MediaMarkt PS5",
        url1: 'https://www.mediamarkt.de',
        url2: '/de/product/_sony-playstation®5-2661938.html'));

    itemsList.addItem(ItemModel(
        title: "Saturn PS5",
        url1: 'https://www.saturn.de',
        url2: '/de/product/_sony-playstation%C2%AE5-2661938.html'));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /* timer = Timer.periodic(
        Duration(seconds: 15),
        (Timer t) =>
            Provider.of<ItemsList>(context, listen: false).checkAllItems());

    */
    Provider.of<ItemsList>(context, listen: false).checkAllItems();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Checkify"),
        ),
        body: Column(
          children: [
            Header(title: "PS5's"),
            FutureBuilder(
              future: itemsList.fetchAllData(0),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: itemsList.items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(Provider.of<ItemsList>(context)
                            .items[index]
                            .isAvailable
                            .toString()),
                        title: Text(itemsList.items[index].title),
                        trailing: Icon(
                          Provider.of<ItemsList>(context)
                                      .items[index]
                                      .isAvailable ==
                                  true
                              ? Icons.check
                              : Icons.remove,
                          color: Colors.green,
                        ),
                        onTap: () {
                          Provider.of<ItemsList>(context).fetchData(index);
                        },
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
