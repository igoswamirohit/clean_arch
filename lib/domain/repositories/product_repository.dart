import 'package:clean/domain/usecases/products_usecase.dart';

import '../../data/models/product_model.dart';

abstract class ProductsRepository {
  Future<ProductModel> getProductList(FetchProductsParams productCatergoryId);
}
