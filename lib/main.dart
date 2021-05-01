import 'package:checkify/model/item_model.dart';
import 'package:checkify/screens/home.dart';
import 'package:checkify/widgets/items_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => ItemsList(),
      child: HomeScreen(),
    ),
  );
}
