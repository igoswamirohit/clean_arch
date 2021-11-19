import 'package:clean/injection_container.dart';
import 'package:clean/presentation/blocs/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> categories = [
    'Tables',
    'Chairs',
    'Sofas',
    'Cupboards'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('NeoSTORE'),
          centerTitle: true,
          leading: Icon(Icons.menu),
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/furniture.jpg'),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                    categories.length,
                    (index) => CategoryBox(
                      title: categories[index],
                      onClick: () {
                        context
                            .read<ProductsBloc>()
                            .add(FetchProducts(index + 1));
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  const CategoryBox({
    Key? key,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  final VoidCallback onClick;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color: Colors.red,
      ),
    );
  }
}
