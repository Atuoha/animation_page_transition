import 'package:flutter/material.dart';

import '../data/list_items.dart';
import '../models/item.dart';
import 'circle_background.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({
    Key? key,
    required this.item,
    required this.provider,
  }) : super(key: key);

  final Item item;
  final ItemData provider;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Image.network(
                item.imgUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child:CircleBackground(
              child: IconButton(
                onPressed: () => provider.toggleIsFav(item),
                icon: Icon(
                  item.isFav ? Icons.favorite : Icons.favorite_border,
                  color: item.isFav ? Colors.red : Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            // right: 60,
            left: 40,
            child: Text(item.title),
          ),
        ],
      ),
    );
  }
}
