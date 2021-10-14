import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xenshop/modules/categories/bloc/category_bloc.dart';
import 'package:xenshop/modules/categories/data_source/category_data_source.dart';
import 'package:xenshop/modules/categories/repository/category_repository.dart';
import 'package:xenshop/modules/categories/screens/category_page.dart';
import 'package:xenshop/theme.dart';
import 'utils/helpers/internet/internet_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.connectivity}) : super(key: key);

  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(
            categoryRepository:
                CategoryRepository(categoryDatasource: CategoryDatasource()),
          ),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      theme: theme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const CategoryPage(),
      },
      //onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
