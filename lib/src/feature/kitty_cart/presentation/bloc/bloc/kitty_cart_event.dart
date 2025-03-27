part of 'kitty_cart_bloc.dart';

@freezed
class KittyCartEvent with _$KittyCartEvent {
  const factory KittyCartEvent.load() = _LoadEvent;
}