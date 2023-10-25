import 'dart:developer';
import 'package:dio/dio.dart';

import '../../../../core/api/api_urls.dart';
import '../../../../core/errors/my_exceptions.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  Dio dio = Dio();
  @override
  Future<List<CategoryModel>> getCategories() async {
    log(ApiUrls.categoryEndpoint);
    final response = await dio.get(ApiUrls.categoryEndpoint);
    if (response.statusCode == 200) {
      List<CategoryModel> categories = [];
      for (String data in response.data) {
        categories.add(CategoryModel.fromJApi(data));
      }
      return categories;
    } else {
      throw const ServerException();
    }
  }
}
