import 'package:class_todo_app/models/cart_item.dart';
import 'package:class_todo_app/models/cart_state.dart';
import 'package:class_todo_app/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 창고 데이터 ( CartState )  <- models 패키지에 있음

// 2. 창고 관리자 ( 비즈니스 로직 + 창고 데이터를 가지고 있음( state ) )
class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return const CartState();
  }

  /// 장바구니에 상품을 추가
  void addProduct(Product productToAdd) {
    // 1. 기존에 장바구니를 가지고 와서 새 리스트를 선언한다.
    List<CartItem> copiedProductList = List.from(state.items);
    // Riverpod은 참조 조소(메모리 주소)를 비교해서 상태 변경을 감지 합니다.
    // 상태 관리: 정확히 리버팟이 상태 변경을 감지 하기 위함이다.

    // state.items -- >  100000
    for (int i = 0; i < copiedProductList.length; i++) {
      // 1. 기존 상품을 찾았다면 수량을 1로 증가 시켜 줘야 한다
      if (productToAdd.id == copiedProductList[i].product.id) {
        CartItem existingItem = copiedProductList[i];
        copiedProductList[i] =
            existingItem.copyWith(quantity: existingItem.quantity + 1);
        state = state.copyWith(items: copiedProductList);
        return;
      }
    }

    // 여기까지 왔다면 새로운 상품이므로 장바구니에 추가
    copiedProductList.add(CartItem(product: productToAdd));
    state = state.copyWith(items: copiedProductList);
    // 리버팟 상태관리 핵심 (기존 데이터 ) = 새로 데이터로 교체
  }

  /// 장바구니에 상품을 삭제
  void removeProduct(int productId) {
    List<CartItem> copiedProductList = List.from(state.items);
    // 해당 상품을 찾아서 제거
    for (int i = 0; i < copiedProductList.length; i++) {
      if (copiedProductList[i].product.id == productId) {
        copiedProductList.removeAt(i);
        state = state.copyWith(items: copiedProductList);
        return; // 찾자 마자 즉시 종료
      }
    }
  }

  /// 장바구니에 상품을 수정
  void updateQuantity(int productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeProduct(productId);
      return; // 즉시 종료
    }

    List<CartItem> copiedProductList = List.from(state.items);

    for (int i = 0; i < copiedProductList.length; i++) {
      if (copiedProductList[i].product.id == productId) {
        copiedProductList[i] =
            copiedProductList[i].copyWith(quantity: newQuantity);
        state = state.copyWith(items: copiedProductList);
        return; // 찾자 마자 즉시 종료
      }
    }
  }
}

//3. 창고 생성
final cartProvider =
    NotifierProvider<CartNotifier, CartState>(() => CartNotifier());

// 4. 사이드 이펙트 (총 장바구니의 개수)
final cartItemCountProvider = Provider<int>((ref) {
  // ref
  final CartState cartState = ref.watch(cartProvider);
  final List<CartItem> cartItems = cartState.items;
  int totalQuantity = 0;
  for (var item in cartItems) {
    totalQuantity = totalQuantity + item.quantity;
  }
  return totalQuantity;
});

// 황지백 — 오후 12:39
// 5. 사이드 이펙트 (총 장바구니의 합계 금액)
final cartTotalPriceProvider = Provider<int>((ref) {
  // 직접 각 아이템의 상품 * 가격을 관리하는 창고를 만들고 화면에 표시하세요
  final CartState cartState = ref.watch(cartProvider);
  final List<CartItem> cartItems = cartState.items;
  int totalPrice = 0;
  for (var item in cartItems) {
    totalPrice = totalPrice + (item.product.price * item.quantity);
  }
  return totalPrice;
});
