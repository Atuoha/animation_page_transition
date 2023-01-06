import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Column(
        children: [
          Image.network('https://images.template.net/98620/free-elegant-purple-background-ghkde.png', fit: BoxFit.cover),
          const SizedBox(height: 10),
          const Text(
            'Phasellus sodales fringilla magna in vulputate. Sed a diam cursus, dignissim metus et, congue est. Etiam aliquet id velit vel tempus. Aenean egestas, urna quis lobortis ornare, velit justo iaculis erat, a volutpat leo risus ultricies diam. Fusce eu mollis lacus, at consectetur nibh. Nulla enim nisl, interdum et vestibulum sit amet, suscipit sed lorem. In convallis egestas sodales.',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
