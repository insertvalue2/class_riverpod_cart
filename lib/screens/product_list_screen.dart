import 'package:class_todo_app/providers/cart_provider.dart';
import 'package:class_todo_app/screens/cart_screen.dart';
import 'package:class_todo_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/product_provider.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch(provider) 계속 지켜 보다가 객체 상태가 변경 되면 자동으로 build 호출 됨
    // ref.read(); // 한번만 읽을 때 사용
    final productList = ref.watch(productListProvider);
    final cartItemCount = ref.watch(cartItemCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 목록'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.shopping_cart),
                iconSize: 28,
              ),
              Positioned(
                right: 8,
                top: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '$cartItemCount',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 한 줄에 표시할 아이템 갯수
            childAspectRatio: 0.7, // 각 아이템에 가로 세로 비율 (0.7 세로가 더 긴 위젯)
            crossAxisSpacing: 8, // 좌우 간격
            mainAxisSpacing: 8, // 상하 간격
          ),
          itemBuilder: (context, index) {
            return ProductCard(product: productList[index]);
          },
          itemCount: productList.length,
        ),
      ),
    );
  }
}
