import 'package:flutter/material.dart';
import 'package:responsive_layout/components/order_item.dart';
import 'package:responsive_layout/components/payment_method.dart';
import 'package:responsive_layout/components/payment_total.dart';

import '../cardapio.dart';
import '../components/main_drawer.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  final List orders = pedido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Pedido',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final order = orders[index];
                  return OrderItem(
                    imageURI: order['image'],
                    itemTitle: order['name'],
                    itemPrice: order['price'],
                  );
                },
                childCount: orders.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Pagamento',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: PaymentMethod(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Confirmar',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: PaymentTotal(),
            ),
          ],
        ),
      ),
    );
  }
}
