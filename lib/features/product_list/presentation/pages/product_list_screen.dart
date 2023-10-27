import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../../locator.dart';
import '../manager/product_bloc.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? categoryName = GoRouterState.of(context).pathParameters['categoryName'];
    log('categoryName: $categoryName');
    return BlocProvider(
      create: (context) => locator<ProductsBloc>()
        ..add(categoryName == null ? GetProductsEvent() : GetProductsByCategoryEvent(categoryName)),
      child: Scaffold(
        appBar: AppBar(actions: [
          context.canPop()
              ? IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(Icons.backspace))
              : const SizedBox.shrink()
        ]),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            RouteInformation;
            if (state is ProductsLoadedState) {
              return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {
                          final int productID = state.products[index].id;
                          final String name = state.products[index].name;
                          context.goNamed(
                            RouteConstants.productDetailName,
                            pathParameters: {
                              'name': name,
                            },
                            queryParameters: {
                              'id': productID.toString(),
                            },
                          );
                        },
                        child: Text(state.products[index].name));
                  });
            } else if (state is ProductFailure) {
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
