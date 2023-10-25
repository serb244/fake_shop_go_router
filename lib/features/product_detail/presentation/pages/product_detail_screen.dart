import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../manager/product_detail_bloc.dart';

class ProductDetailScreen extends StatelessWidget {
  final String id;
  final String name;
  const ProductDetailScreen({required this.id, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          locator<ProductDetailBloc>()..add(ProductDetailGetByIdEvent(id: int.parse(id))),
      child: Scaffold(
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
