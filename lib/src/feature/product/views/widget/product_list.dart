import 'package:crypstore/src/feature/product/controller/product_controller.dart';
import 'package:crypstore/src/feature/product/views/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListView extends ConsumerWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productControllerProvider);
    if (productState.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    final products = productState.products;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductListTile(product: products[index]);
      },
    );
  }
}
