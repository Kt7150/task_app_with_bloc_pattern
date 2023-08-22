import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app_with_bloc_pattern/bloc/BannerBloc/Banner_Bloc.dart';
import 'package:task_app_with_bloc_pattern/respository/Bannerrepository.dart';
import 'package:task_app_with_bloc_pattern/respository/ListingRepository.dart';
import 'package:task_app_with_bloc_pattern/ui/HomeScreen.dart';

import 'bloc/ListingBloc/Listing_Bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
        BlocProvider<BannerBloc>(create: (context)=>BannerBloc(BannerRepository())),
        BlocProvider<ListingBloc>(create: (context) => ListingBloc(ListingRepository())),

    ],
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
       home: HomeScreen()
    )
    );
  }
}


