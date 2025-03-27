import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitty_app/src/core/utils/logger.dart';
import 'package:kitty_app/src/feature/kitty_cart/data/repository/catfact_ninja_repository.dart';
import 'package:kitty_app/src/feature/kitty_cart/data/repository/http_cat_repository.dart';

part 'kitty_cart_event.dart';
part 'kitty_cart_state.dart';
part '_generated/kitty_cart_bloc.freezed.dart';

class KittyCartBloc extends Bloc<KittyCartEvent, KittyCartState> {
  KittyCartBloc({
    required CatfactNinjaRepository catfactNinjaRepository,
    required HttpCatRepository httpCatRepository,
  }) : _catfactNinjaRepository = catfactNinjaRepository,
       _httpCatRepository = httpCatRepository,
       super(KittyCartState.initial()) {
    on<KittyCartEvent>(
      _onKittyCartEvent,
      transformer: bloc_concurrency.concurrent(),
    );

    add(KittyCartEvent.load());
  }

  final CatfactNinjaRepository _catfactNinjaRepository;
  final HttpCatRepository _httpCatRepository;

  FutureOr<void> _onKittyCartEvent(
    KittyCartEvent event,
    Emitter<KittyCartState> emit,
  ) async {
    await event.map<FutureOr<void>>(load: (event) => _onLoad(event, emit));
  }

  FutureOr<void> _onLoad(_LoadEvent event, Emitter<KittyCartState> emit) async {
    emit(KittyCartState.loading());
    try {
      final String fact = await _catfactNinjaRepository.getRandomFactAboutCat();
      final String imageUrl =
          await _httpCatRepository.getUrlRandomImageAboutCat();

      emit(KittyCartState.loaded(fact: fact, imageUrl: imageUrl));
    } catch (e, st) {
      logger.error('httpError', e, st);
      emit(KittyCartState.error(message: 'Ошибка на стороне сервера'));
    }
  }
}
