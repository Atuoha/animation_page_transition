import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/data/list_items.dart';
import 'package:provider/provider.dart';
import '../component/circle_background.dart';
import '../models/item.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ItemData>(context);
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var item = provider.findById(data['id'] as int);
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leadingWidth: 43,
        leading: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(left:15.0),
            child: CircleBackground(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
              ),
            ),
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:18.0),
            child: CircleBackground(
              child: IconButton(
                onPressed: () => provider.toggleIsFav(item),
                icon: Icon(
                  item.isFav ? Icons.favorite : Icons.favorite_border,
                  color: item.isFav ? Colors.red : Colors.deepPurple,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height / 2,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(item.subtitle,textAlign: TextAlign.justify,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
