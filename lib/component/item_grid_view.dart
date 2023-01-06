import 'package:flutter/material.dart';
import 'package:page_transition/component/single_item.dart';
import '../data/list_items.dart';
import '../models/item.dart';
import '../screens/details.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animations/animations.dart';

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
        return
            // GestureDetector(
            //   onTap: () => Navigator.of(context).pushNamed(
            //     DetailsScreen.routeName,
            //     arguments: {'id': item.id},
            //  ),
            //  child:

            OpenContainer(
          transitionDuration: const Duration(seconds: 3),
          transitionType: ContainerTransitionType.fadeThrough,
          openBuilder: (BuildContext context, _) => DetailsScreen(item: item),
          closedBuilder:
              (BuildContext context, void Function() openContainer) =>
                  SingleItem(
            item: item,
            provider: provider,
          ),
          //  ),
        );
      },
    );
  }
}
