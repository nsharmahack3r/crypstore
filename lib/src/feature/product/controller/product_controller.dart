import 'dart:developer';

import 'package:crypstore/src/feature/product/controller/state.dart';
import 'package:crypstore/src/feature/product/repository/product_repository.dart';
import 'package:crypstore/src/models/product.dart';
import 'package:crypstore/src/utils/config.dart';
import 'package:crypstore/src/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productControllerProvider = StateNotifierProvider<ProductController, ProductControllerState>((ref) {
  final repo = ref.watch(productRepoProvider);
  return ProductController(repo: repo);
});

class ProductController extends StateNotifier<ProductControllerState> {
  final ProductRepo _repo;
  ProductController({required ProductRepo repo})
      : _repo = repo,
        super(
          ProductControllerState(
            products: [],
            loading: false,
          ),
        );

  Future<List<Product>?> getProducts({BuildContext? context}) async {
    if(state.loading){
      return null;
    }
    state = state.copyWith(loading: true);
    final result = await _repo.getProducts();
    return result.fold(
      (failure) {
        if (AppConfig.devMode && context != null) {
          log(failure.message);
          SnackBarService.showSnackBar(
              context: context, message: "Fialed to fetch products");
        }
        state = state.copyWith(loading: false);
        return null;
      },
      (products) {
        if (AppConfig.devMode && context != null) {
          SnackBarService.showSnackBar(
              context: context, message: "Products fetched successfully");
        }
        state = state.copyWith(products: [...state.products, ...products], loading: false);
        return products;
      },
    );
  }
}
