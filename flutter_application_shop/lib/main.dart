import 'package:flutter/material.dart';
import 'package:flutter_application_shop/ui/cubit/home_cubit.dart';
import 'package:flutter_application_shop/ui/cubit/ikincisayfa_cubit.dart';
import 'package:flutter_application_shop/ui/views/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( 
      providers: [
        BlocProvider(create: (context) => HomeCubit(),),
        BlocProvider(create: (context) => IkinciSayfaCubit(),),
      ], 
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

