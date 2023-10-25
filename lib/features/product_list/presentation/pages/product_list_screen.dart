import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../../locator.dart';
import '../manager/product_bloc.dart';

class ProductListScreen extends StatelessWidget {
  final String categoryName;

  const ProductListScreen({required this.categoryName, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ProductsBloc>()..add(GetProductsByCategoryEvent(categoryName)),
      child: Scaffold(
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadedState) {
              return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                        onPressed: () {
                          final int productID = state.products[index].id;
                          final String name = state.products[index].name;
                          final path = '${RouteConstants.productDetailPath}/$name';
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
                        // onPressed: () {
                        //   final int productID = state.products[index].id;
                        //   final String name = state.products[index].name;
                        //   final path = '${RouteConstants.productDetailPath}/$name';
                        //   context.go(
                        //     path,
                        //     extra: productID,
                        //   );
                        // },
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
