import 'package:crypstore/src/models/product.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});

  static const path = "/product";

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Hero(
                  tag: product.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      product.images[0],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 22),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber,),
                        Text(
                          '${product.rating}',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const Text(
                      "Product Info",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 24
                      ),
                    ),
                    MaterialButton(
                      elevation: 0.0,
                      color: Colors.blue,
                      onPressed: (){},
                      child: const Text("Buy Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}