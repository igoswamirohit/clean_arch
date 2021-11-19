part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsFetchProgress extends ProductsState {}

class ProductsFurtherFetchProgress extends ProductsState {}

class ProductsFetchSuccess extends ProductsState {
  ProductsFetchSuccess(this.productModel);

  final ProductModel productModel;
}

class ProductsFetchFailure extends ProductsState {
  final exception;

  ProductsFetchFailure(this.exception);
}
