import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:green_route/Models/product_model.dart';

final cartProductsProvider = StateProvider<List<Products>>((ref) => []);