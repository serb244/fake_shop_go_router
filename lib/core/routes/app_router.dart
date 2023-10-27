import 'dart:developer';

import 'package:fake_shop_go_router/features/home/presentation/pages/home_screen.dart';
import 'package:fake_shop_go_router/features/product_list/presentation/pages/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/product_detail/presentation/pages/product_detail_screen.dart';
import 'go_router_observer.dart';
import 'route_constants.dart';

class AppRouter {
  GoRouter get router => _router;
  final GoRouter _router = GoRouter(
    // routerNeglect: true,
    observers: [
      GoRouterObserver(),
    ],
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
          path: RouteConstants.productListPath,
          builder: (BuildContext context, GoRouterState state) {
            return const ProductListScreen();
          },
          routes: [
            GoRoute(
                name: RouteConstants.productCategoryListName,
                path: ':categoryName',
                builder: (BuildContext context, GoRouterState state) {
                  return const ProductListScreen();
                }),
          ]),
      GoRoute(
        name: RouteConstants.productDetailName,
        path: '${RouteConstants.productDetailPath}/:name',
        builder: (BuildContext context, GoRouterState state) {
          return const ProductDetailScreen();
        },
        // redirect: (context, state) {
        //   log('redirect state: ${state}');
        //   log('redirect state.uri.queryParameters: ${state.uri.queryParameters}');
        //   log('redirect state.pathParameters: ${state.pathParameters}');
        //   try {
        //     return int.parse(state.uri.queryParameters['id']!) > 10
        //         ? null
        //         : RouteConstants.productListPath + "/jewelery";
        //   } catch (e) {
        //     return null;
        //   }
        // },
      ),
    ],
  );
}
