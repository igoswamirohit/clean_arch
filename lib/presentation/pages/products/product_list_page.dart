import 'package:clean/data/models/product_model.dart';
import 'package:clean/presentation/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/extensions/extensions.dart';

class ProductListPage extends StatefulWidget {
  static const routeName = '/productListPage';

  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<ProductData>? _productList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0,
        title: Text('Tables'),
      ),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if(state is ProductsFetchSuccess){
            _productList = state.productModel.data;
          }
        },
        builder:(_, state) {
          if(state is ProductsFetchProgress)
            return Center(child: CircularProgressIndicator());
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(itemBuilder: (context, index) {
              ProductData _product = _productList![index];
              return Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Image.network(_product.productImages,fit: BoxFit.contain,),),
                    SizedBox(width: 10,),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(_product.name, style: TextStyle(fontSize: 18),),
                          Text(_product.producer, style: TextStyle(fontSize: 12),),
                          SizedBox(height: 10,),
                          Text('Rs. ${_product.cost.toString()}', style: TextStyle(fontSize: 20, color: Colors.red),)
                        ],
                      ),
                    )
                  ],
                ),
              );
            }, separatorBuilder: (context, index) => Divider(
              height: context.height * 0.03,
              thickness: 2,
            ), itemCount: _productList!.length),
          );
        },
      ),
    );
  }
}
