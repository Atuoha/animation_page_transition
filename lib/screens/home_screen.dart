import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/circle_background.dart';
import '../data/list_items.dart';
import 'details.dart';

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
      body:
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child:SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: GridView.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              var item = items[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  DetailsScreen.routeName,
                  arguments: {'id': item.id},
                ),
                child: Card(
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
                ),
              );
            }),
      ),
      )
    );
  }
}
