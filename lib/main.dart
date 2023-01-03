import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_fetching_api_bloc/logic/blocs/bloc/jokes_bloc.dart';
import 'package:practice_fetching_api_bloc/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Jokes',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomeScreen(),
      // },
      home: BlocProvider<JokesBloc>(
        create: (context) => JokesBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
