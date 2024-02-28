// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:crypstore/src/models/product.dart';

class ProductControllerState {
  final List<Product> products;
  final bool loading;

  ProductControllerState({required this.products, required this.loading});
  
  ProductControllerState copyWith({
    List<Product>? products,
    bool? loading,
  }) {
    return ProductControllerState(
      products: products ?? this.products,
      loading: loading ?? this.loading,
    );
  }
}
