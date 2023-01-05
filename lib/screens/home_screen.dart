import 'package:flutter/material.dart';

import '../data/list_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iphones'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1.2,
        child: GridView.builder(
          itemCount: listItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Card(
            elevation:3,
            color: Colors.white,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(
                      listItems[index].imgUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  // right: 60,
                  left: 60,
                  child: Text(listItems[index].title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
