import 'package:crypstore/src/feature/product/views/product_view.dart';
import 'package:crypstore/src/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        context.push(ProductView.path, extra: product);
      },
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero( tag: product.id, child: Image.network(product.images[0], width: 120, height: 120, fit: BoxFit.cover,)),
          const SizedBox(width: 10,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Text(product.description, maxLines: 2, overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 10,),
                Text("${product.price}", maxLines: 2, overflow: TextOverflow.ellipsis,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}