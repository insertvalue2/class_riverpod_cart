// Provider 는 '읽기 전용' 데이터를 제공하는 가장 기본적인 Provider 입니다

import 'package:class_todo_app/data/sample_products.dart';
import 'package:class_todo_app/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 읽기 전용 데이터를 보관할 때 Provider 사용할 수 있다.
final productListProvider = Provider<List<Product>>(
  (ref) {
    // ref 파라미터는 다른 Provider를 참조할 때 사용할 수 있다.
    return sampleProducts;
  },
);
