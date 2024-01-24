import 'package:flutter/material.dart';
import 'package:responsive_layout/cardapio.dart';
import 'package:responsive_layout/components/drink_item.dart';

class DrinkMenu extends StatelessWidget {
  const DrinkMenu({Key? key}) : super(key: key);

  final List items = drinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 16.0,
              ),
              child: Text(
                'Bebidas',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: items.length,
              (context, index) {
                final drink = items[index];
                return DrinkItem(
                  imageURI: drink['image'],
                  itemTitle: drink['name'],
                  itemPrice: drink['price'],
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 3
                      : 2,
              childAspectRatio:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 1.2
                      : 158 / 194,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
          )
        ],
      ),
    );
  }
}
