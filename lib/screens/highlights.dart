import 'package:flutter/material.dart';
import 'package:responsive_layout/cardapio.dart';
import 'package:responsive_layout/components/highlight_item.dart';

class Highlights extends StatelessWidget {
  const Highlights({Key? key}) : super(key: key);

  final List highlights = destaques;

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Destaques do dia',
                style: TextStyle(
                  fontFamily: 'Caveat',
                  fontSize: 32,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLandscape ? 3 : 1,
              crossAxisSpacing: isLandscape ? 8.0 : 0.0,
              mainAxisSpacing: isLandscape ? 8.0 : 0.0,
              childAspectRatio: isLandscape ? 0.6 : 0.9,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = highlights[index];
                return HighlightItem(
                  imageURI: item['image'],
                  itemTitle: item['name'],
                  itemPrice: item['price'],
                  itemDescription: item['description'],
                );
              },
              childCount: highlights.length,
            ),
          )
        ],
      ),
    );
  }
}
