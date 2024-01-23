import 'package:flutter/material.dart';
import 'package:responsive_layout/components/food_item.dart';

import '../cardapio.dart';

class FoodMenu extends StatelessWidget {
  const FoodMenu({Key? key}) : super(key: key);

  final List menu = comidas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = menu[index];

                return FoodItem(
                  itemTitle: item['name'],
                  itemPrice: item['price'],
                  imageURI: item['image'],
                );
              },
              childCount: menu.length,
            ),
          ),
        ],
      ),
    );
  }
}
