import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Apis/repository/news_reposeitory.dart';
import 'package:newsapp/Apis/wepServices/news_wep_ser.dart';
import 'package:newsapp/bloc_control/cubit/news_cubit.dart';
import 'package:newsapp/views/screens/home_page.dart';

void main() {
  runApp(const MyApp());
  NewsRepository(NewsWepService()).getNews();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => NewsCubit(NewsRepository(NewsWepService())),
        child: const HomePage(),
      ),
    );
  }
}
