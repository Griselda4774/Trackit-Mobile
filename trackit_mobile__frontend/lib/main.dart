import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/profileBloc/profile_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/lazadaBloc/lazada_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/loginBloc/login_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/registerBloc/register_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/shopeeBloc/shopee_bloc.dart';
import 'package:trackit_mobile__frontend/blocs/statisticalBloc/statistical_bloc.dart';
import 'package:trackit_mobile__frontend/repositories/authRepository.dart';
import 'package:trackit_mobile__frontend/repositories/orderRepository.dart';

import 'package:trackit_mobile__frontend/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthRepository _authRepository = AuthRepository();
  final OrderRepository _orderRepository = OrderRepository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(authRepository: _authRepository)),
        BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(authRepository: _authRepository)),
        BlocProvider<ShopeeBloc>(
          create: (context) => ShopeeBloc(orderRepository: _orderRepository)
            ..add(ShopeeFetchEvent()),
        ),
        BlocProvider<LazadaBloc>(
          create: (context) => LazadaBloc(orderRepository: _orderRepository)
            ..add(LazadaFetchEvent()),
        ),
        BlocProvider<StatisticalBloc>(
          create: (context) => StatisticalBloc(orderRepository: _orderRepository)
            ..add(StatisticalfetchOrderData()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(authRepository: _authRepository)
            ..add(LogOutUser()),
        ),
      ],
      // child: ChangeNotifierProvider(
      // create: (context) => DataProvider(),
      child: MainApp(),
      // ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
