import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_cubit/cubit/posts_cubit.dart';
import 'package:pagination_cubit/data/repositories/posts_respository.dart';
import 'package:pagination_cubit/data/services/posts_service.dart';
import 'package:pagination_cubit/pages/posts_screen.dart';

void main() {
  runApp(MyApp(
    repository: PostsRepository(PostsService()),
  ));
}

class MyApp extends StatelessWidget {
  final PostsRepository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => PostsCubit(repository),
        child: PostsView(),
      ),
    );
  }
}
