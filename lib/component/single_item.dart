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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: SizedBox(
                // height: 140,
                width: double.infinity,
                child: Image.network(
                  item.imgUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 2,
              right: 2,
              child: CircleBackground(
                radius: 17,
                child: IconButton(
                  onPressed: () => provider.toggleIsFav(item),
                  icon: Icon(
                    item.isFav ? Icons.favorite : Icons.favorite_border,
                    color: item.isFav ? Colors.red : Colors.white,
                    size:20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 2,
              left: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
