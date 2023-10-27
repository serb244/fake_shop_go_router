import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../locator.dart';
import '../manager/product_detail_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final Map<String, String> queryParameters = GoRouterState.of(context).uri.queryParameters;
    final Map<String, List<String>> queryParametersAll =
        GoRouterState.of(context).uri.queryParametersAll;
    log('location: $location');
    log('queryParameters.toString() : ${queryParameters.toString()}');
    log('queryParametersAll.toString() : ${queryParametersAll.toString()}');
    final int id = int.parse(queryParameters['id']!);
    return BlocProvider(
      create: (context) => locator<ProductDetailBloc>()..add(ProductDetailGetByIdEvent(id: id)),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            context.canPop()
                ? IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.backspace))
                : const SizedBox.shrink()
          ],
          title: Text(GoRouterState.of(context).pathParameters['name'] ?? ''),
        ),
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailLoadedState) {
              return ListTile(
                  title: Text(state.product.name),
                  subtitle: Text(state.product.description),
                  trailing: Text(state.product.price.toString()),
                  leading: Image.network(
                    state.product.image,
                  ));
            } else if (state is ProductDetailFailureState) {
              return Center(child: Text(state.errorMsg));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
