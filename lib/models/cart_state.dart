import 'package:class_todo_app/models/cart_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    // 장바구니에 담기 상품 목록
    @Default([]) List<CartItem> items,
    // 1.로딩 상태
    @Default(false) bool isLoading,
    // 2. 에러 상태
    String? error,
  }) = _CartState;
}
