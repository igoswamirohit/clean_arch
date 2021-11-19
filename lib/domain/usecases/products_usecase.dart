
import '../../core/usecases/usecase.dart';
import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class FetchProductsUseCase implements UseCase<ProductModel, int> {
  final ProductsRepository repository;

  FetchProductsUseCase(this.repository);

  @override
  Future<ProductModel> call(int productCategoryId) async {
    return await repository.getProductList(productCategoryId);
  }
}
