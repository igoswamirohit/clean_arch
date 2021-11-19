import '../../data/models/product_model.dart';

abstract class ProductsRepository {
  Future<ProductModel> getProductList(int productCatergoryId);
}
