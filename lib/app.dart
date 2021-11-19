import 'package:clean/injection_container.dart';
import 'package:clean/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:clean/presentation/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/router.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<ProductsBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Neo Store',
        theme: ThemeData(
          primaryColor: Color(0xff9e0100),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Colors.white,
            selectionHandleColor: Colors.white,
          ),
        ),
        // initialRoute: ProductListPage.routeName,
        onGenerateRoute: CustomRouter.generateRoute,
      ),
    );
  }
}
