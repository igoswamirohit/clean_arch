import '../../../../core/service/link_outside_world.dart';
import '../../../core/constants/api_constants.dart';
import '../../models/product_model.dart';

abstract class ProductsRemoteDataSource {
  /// Calls the http://staging.php-dev.in:8844/trainingapp/api/products/getList endpoint.
  Future<ProductModel> getProductList(int productCatId);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  ProductsRemoteDataSourceImpl(this.service);

  final LinkToOutSideWorld service;

  @override
  Future<ProductModel> getProductList(int productCatId) async {
    return await service.request<ProductModel>(
        url: ApiConstants.PRODUCTS,
        method: GET,
        params: {'product_category_id': productCatId});
  }
}
