import 'package:crypstore/src/feature/favourites/view/favourites.dart';
import 'package:crypstore/src/feature/home/views/widget/drawer.dart';
import 'package:crypstore/src/feature/product/controller/product_controller.dart';
import 'package:crypstore/src/feature/product/views/widget/product_list.dart';
import 'package:crypstore/src/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const path = "/";

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(productControllerProvider.notifier).getProducts();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppStrings.appName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: (){
            context.push(FavouritesView.path);
          }, icon: const Icon(Icons.favorite)),
        ],
      ),
      body: const ProductListView(),
    );
  }
}
