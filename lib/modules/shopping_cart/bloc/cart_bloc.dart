import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:xenshop/modules/shopping_cart/model/cart_model.dart';
import 'package:xenshop/modules/shopping_cart/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cartRepository}) : super(const CartState());
  final CartRepository cartRepository;

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is FetchUserCartList) {
      yield await mapCartToState(state, event);
    }else if (event is RemoveProductFromCart){
      yield await mapRemoveProductFromCartToState(state, event);
    }else if (event is ChangeStateCart){
      yield state.copyWith(
        status: CartStatus.success
      );
    }
  }

  Future<CartState> mapCartToState(CartState state, FetchUserCartList event) async {
    try {
      final response = await cartRepository.getUserCartData();
      var mappedList = response.map((i) => CartModel.fromJson(i)).toList();
      List<CartModel> list = [];
      int totalItemsInCart = 0;
      for(int i=0 ; i<mappedList.length; i++){
        list.add(mappedList[i]);
        totalItemsInCart = totalItemsInCart + list[i].products!.length;
      }
      return state.copyWith(
          status: CartStatus.success,
          message: 'success',
          totalItemsInCart: totalItemsInCart,
          cartList: list);
    } on Exception {
      return state.copyWith(status: CartStatus.failure, message: '');
    }
  }

  Future<CartState> mapRemoveProductFromCartToState(CartState state, RemoveProductFromCart event) async {
    try {
      final response = await cartRepository.removeProductFromCart(cartId: event.cartId);
      var total = state.totalItemsInCart - 1;

      return state.copyWith(
          status: CartStatus.deleteSuccess,
          message: 'success',
          totalItemsInCart: total >=0 ? total : 0 ,
      );
    } on Exception {
      return state.copyWith(status: CartStatus.failure, message: '');
    }
  }

}
