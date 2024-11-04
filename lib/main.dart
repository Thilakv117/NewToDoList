import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/bloc/to_do_bloc.dart';
import 'package:to_do_list/models/http_model.dart';
import 'package:to_do_list/pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<ToDoModel> lists = [];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ToDoBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
