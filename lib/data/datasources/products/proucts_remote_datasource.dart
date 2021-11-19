import 'package:clean/domain/usecases/products_usecase.dart';

import '../../../../core/service/link_outside_world.dart';
import '../../../core/constants/api_constants.dart';
import '../../models/product_model.dart';

abstract class ProductsRemoteDataSource {
  /// Calls the http://staging.php-dev.in:8844/trainingapp/api/products/getList endpoint.
  Future<ProductModel> getProductList(FetchProductsParams fetchProductsParams);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ProductsRemoteDataSourceImpl(this.service);

  final LinkToOutSideWorld service;

  @override
  Future<ProductModel> getProductList(FetchProductsParams fetchProductsParams) async {
    return await service.request<ProductModel>(
        url: ApiConstants.PRODUCTS,
        method: GET,
        params: {'product_category_id': fetchProductsParams.productCategoryId,
        'page':fetchProductsParams.page});
  }
}
