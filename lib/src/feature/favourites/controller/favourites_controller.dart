import 'package:crypstore/src/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favouriteControllerProvider = StateProvider<List<Product>>((ref) => []);