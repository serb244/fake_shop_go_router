import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fake_shop_go_router/features/product_list/data/models/product_model.dart';

import '../../../../core/api/api_urls.dart';
import '../../../../core/errors/my_exceptions.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getProductsByCategory(String category);
  Future<ProductModel> getProductById(int id);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  Dio dio = Dio();
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get(ApiUrls.productsEndpoint);
    if (response.statusCode == 200) {
      List<ProductModel> products = [];
      for (Map<String, dynamic> data in response.data) {
        products.add(ProductModel.fromJson(data));
      }
      return products;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    final String uri = "${ApiUrls.productsEndpoint}/$id";
    final response = await dio.get(uri);
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final String uri = "${ApiUrls.productsEndpoint}/category/$category";
    log(uri);
    final response = await dio.get(uri);
    if (response.statusCode == 200) {
      // List<Map<String, dynamic>> res = jsonDecode(response.data);
      List<ProductModel> products = [];
      for (Map<String, dynamic> data in response.data) {
        products.add(ProductModel.fromJson(data));
      }
      return products;
    } else {
      throw const ServerException();
    }
  }
}
