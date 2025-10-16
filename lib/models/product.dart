import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed // 소문자 어노테이션 사용 - 이 클래스가 Freezed의 대상임을 알림
class Product with _$Product {
  const factory Product(
      {required int id,
      required String name,
      required int price,
      String? description,
      String? imageUrl,
      String? category}) = _Product;
}
