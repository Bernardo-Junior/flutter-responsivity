import 'package:flutter/material.dart';

class DrinkItem extends StatelessWidget {
  const DrinkItem({
    Key? key,
    required this.imageURI,
    required this.itemTitle,
    required this.itemPrice,
  }) : super(key: key);
  final String imageURI;
  final String itemTitle;
  final String itemPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
      child: Column(
        children: <Widget>[
          Image(
            width: double.infinity,
            height: 94,
            image: AssetImage(imageURI),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  itemTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  "R\$ $itemPrice",
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
