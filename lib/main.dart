import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_favorite/application/job_favorite/job_favorite_bloc.dart';
import 'package:flutter_bloc_favorite/job.dart';
import 'package:flutter_bloc_favorite/job_detail.dart';
import 'package:flutter_bloc_favorite/job_list_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobFavoriteBloc(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes,
    );
  }

  //ANCHOR - _routes
  Route<dynamic>? _routes(settings) {
    if (settings.name == '/job_detail') {
      final job = settings.arguments as Job;
      return MaterialPageRoute(
        builder: (context) => JobDetail(job: job),
      );
    }

    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: JobListWidget(),
        ),
      );
    }

    return null;
  }
}
