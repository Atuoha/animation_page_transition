import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../component/item_grid_view.dart';
import '../data/list_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ItemData>(context);
    var items = provider.listItems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iphones'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.2,
          child: ItemGridView(items: items, provider: provider),
        ),
      ),
    );
  }
}
