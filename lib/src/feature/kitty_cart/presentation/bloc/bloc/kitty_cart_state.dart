part of 'kitty_cart_bloc.dart';

@freezed
class KittyCartState with _$KittyCartState {
  const factory KittyCartState.initial() = _InitialState;
  const factory KittyCartState.loading() = _LoadingState;
  const factory KittyCartState.loaded({
    required String fact,
    required String imageUrl,
  }) = _LoadedState;
  const factory KittyCartState.error({required String message}) = _ErrorState;
}
