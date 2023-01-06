import 'package:flutter/material.dart';
import 'package:page_transition/component/single_item.dart';
import '../data/list_items.dart';
import '../models/item.dart';
import '../screens/details.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ItemGridView extends StatelessWidget {
  const ItemGridView({
    Key? key,
    required this.items,
    required this.provider,
  }) : super(key: key);

  final List<Item> items;
  final ItemData provider;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var item = items[index];
        return GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(
            DetailsScreen.routeName,
            arguments: {'id': item.id},
          ),
          child: SingleItem(item: item, provider: provider),
        );
      },
    );
  }
}
