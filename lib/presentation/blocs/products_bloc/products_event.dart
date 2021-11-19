part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductsEvent {
  final int productCategoryId;
  final int page;

  FetchProducts(this.productCategoryId,this.page);
}
