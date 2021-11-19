import '../../domain/repositories/product_repository.dart';
import '../datasources/products/proucts_remote_datasource.dart';
import '../models/product_model.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsRemoteDataSource remoteDataSource;

  ProductsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ProductModel> getProductList(int productCategoryId) async {
    return remoteDataSource.getProductList(productCategoryId);
  }
}
