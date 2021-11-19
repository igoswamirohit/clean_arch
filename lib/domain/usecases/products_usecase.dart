
import '../../core/usecases/usecase.dart';
import '../../data/models/product_model.dart';
import '../repositories/product_repository.dart';

class FetchProductsUseCase implements UseCase<ProductModel, FetchProductsParams> {
  final ProductsRepository repository;

  FetchProductsUseCase(this.repository);

  @override
  Future<ProductModel> call(FetchProductsParams fetchProductsParams) async {
    return await repository.getProductList(fetchProductsParams);
  }
}

class FetchProductsParams {
  final int productCategoryId;
  final int page;

  FetchProductsParams(this.productCategoryId, this.page);
}
