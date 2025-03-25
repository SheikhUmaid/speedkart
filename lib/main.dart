import 'package:flutter/material.dart';
import 'app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart/bloc/cart_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider<CartBloc>(create: (context) => CartBloc())],
      child: MyApp(),
    ),
  );
}
