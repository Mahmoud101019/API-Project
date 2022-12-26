import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String? title;
  String? urlToImage;
  CardWidget({super.key, this.title, this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          urlToImage!,
          height: 300,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title!),
        )
      ],
    ));
  }
}