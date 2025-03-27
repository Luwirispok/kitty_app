import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kitty_app/src/core/constant/assets/assets.gen.dart';
import 'package:kitty_app/src/core/utils/extensions/extension.dart';
import 'package:kitty_app/src/core/widget/text.dart';
import 'package:kitty_app/src/feature/kitty_cart/presentation/bloc/bloc/kitty_cart_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'components/error_component.dart';
part 'components/loaded_component.dart';
part 'components/loading_component.dart';

class KittyCartScreen extends StatelessWidget {
  const KittyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.appColor.surface,
        title: const Text('Кошечки'),
        actions: [
          IconButton(
            onPressed:
                () => context.read<KittyCartBloc>().add(KittyCartEvent.load()),
            icon: Icon(Icons.refresh, color: context.theme.appColor.primary),
          ),
        ],
      ),
      backgroundColor: context.theme.appColor.background,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KittyCartBloc, KittyCartState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => _LoadingComponent(),
          loading: (_) => _LoadingComponent(),
          loaded:
              (state) => Center(
                child: _LoadedComponent(
                  fact: state.fact,
                  imageUrl: state.imageUrl,
                ),
              ),
          error: (state) => _ErrorComponent(message: state.message),
        );
      },
    );
  }
}
