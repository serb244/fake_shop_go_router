import 'package:fake_shop_go_router/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/widgets/appbars/small_appbar.dart';
import '../../../../core/routes/routes.dart';
import '../manager/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>()..add(HomeGetCategories()),
      child: Scaffold(
        appBar: SmallAppBar(
            title: 'HomeScreen',
            action: context.canPop()
                ? IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.backspace))
                : const SizedBox.shrink()),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccess) {
              return Center(
                child: ListView.builder(
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) => TextButton(
                      onPressed: () {
                        final String categoryName = state.categories[index].name;
                        final path = '${RouteConstants.productListPath}/$categoryName';
                        // context.go(path);
                        context.goNamed(
                          RouteConstants.productCategoryListName,
                          pathParameters: {
                            'categoryName': categoryName,
                          },
                        );
                      },
                      child: Text(state.categories[index].name)),
                ),
              );
            } else if (state is HomeError) {
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
