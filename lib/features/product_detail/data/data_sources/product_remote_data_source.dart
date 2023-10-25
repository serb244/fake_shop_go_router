
import 'package:dio/dio.dart';
import 'package:fake_shop_go_router/features/product_list/data/models/product_model.dart';

import '../../../../core/api/api_urls.dart';
import '../../../../core/errors/my_exceptions.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductById(int id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  Dio dio = Dio();

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
}
