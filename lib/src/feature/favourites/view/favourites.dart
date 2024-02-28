import 'package:crypstore/src/feature/favourites/controller/favourites_controller.dart';
import 'package:crypstore/src/feature/product/views/widget/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesView extends ConsumerWidget {
  const FavouritesView({super.key});

  static const path = '/favourites';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(favouriteControllerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Favourites",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: products.isEmpty
          ? const Center(
              child: Text('Items added to favourites appear here.'),
            )
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductListTile(product: products[index]);
              },
            ),
    );
  }
}
