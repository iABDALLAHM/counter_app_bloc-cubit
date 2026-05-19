import 'package:counter_app/logic/counter_bloc/counter_bloc.dart';
import 'package:counter_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext myAppContext) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: HomeScreen(
          title: 'Bloc & Cubit Test',
          color: Color.fromARGB(133, 117, 83, 255),
        ),
      ),
    );
  }
}
