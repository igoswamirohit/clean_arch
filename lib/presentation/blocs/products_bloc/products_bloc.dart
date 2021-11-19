import 'package:bloc/bloc.dart';
import 'package:clean/domain/usecases/products_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.productsUseCase) : super(ProductsInitial());

  final FetchProductsUseCase productsUseCase;

  @override
  Stream<ProductsState> mapEventToState(
    ProductsEvent event,
  ) async* {
    if (event is FetchProducts) {
      try {
        yield ProductsFetchProgress();
        final productList = await productsUseCase(event.productCategoryId);
        yield ProductsFetchSuccess(productList);
      } on Exception catch (e) {
        yield ProductsFetchFailure(e);
      }
    }
  }
}
