import 'package:class_todo_app/models/cart_item.dart';
import 'package:class_todo_app/providers/cart_provider.dart';
import 'package:class_todo_app/widgets/cart_item_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<CartItem> carItemList = ref.watch(cartProvider).items;
    final cartTotalPrice = ref.watch(cartTotalPriceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('장바구니'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: carItemList.isEmpty
          ? const Center(
              child: Text('장바구니가 비었습니다'),
            )
          : ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: carItemList.length,
              itemBuilder: (context, index) {
                return CartItemTitle(cartItem: carItemList[index]);
              },
            ),
      bottomNavigationBar: carItemList.isEmpty
          ? null
          : Container(
              padding: EdgeInsets.all(16.0),
              child: SafeArea(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '총액 : ${cartTotalPrice} 원',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('주문하기'),
                  )
                ],
              )),
            ),
    );
  }
}
