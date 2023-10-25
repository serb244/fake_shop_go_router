import 'dart:developer';

import 'package:fake_shop_go_router/features/home/presentation/pages/home_screen.dart';
import 'package:fake_shop_go_router/features/product_list/presentation/pages/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/product_detail/presentation/pages/product_detail_screen.dart';
import 'route_constants.dart';

class AppRouter {
  GoRouter get router => _router;
  final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: RouteConstants.homePath,
        name: RouteConstants.homeName,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        name: RouteConstants.productListName,
        path: '${RouteConstants.productListPath}/:categoryName',
        builder: (BuildContext context, GoRouterState state) {
          return ProductListScreen(
            categoryName: state.pathParameters['categoryName'] ?? '',
          );
        },
      ),
      GoRoute(
        name: RouteConstants.productDetailName,
        path: '${RouteConstants.productDetailPath}/:name',
        builder: (BuildContext context, GoRouterState state) {
          // final Map<String, String> queryParameters = GoRouterState.of(context).uri.queryParameters;
          // final Map<String, List<String>> queryParametersAll =
          //     GoRouterState.of(context).uri.queryParametersAll;
          // log(queryParameters.toString());
          // log(queryParametersAll.toString());
          final name = state.pathParameters['name'];
          // final id = state.pathParameters['id'];
          final id = state.uri.queryParameters['id'];
          return ProductDetailScreen(
            name: name ?? '',
            id: id ?? '',
          );
        },
      ),
    ],
  );
}
