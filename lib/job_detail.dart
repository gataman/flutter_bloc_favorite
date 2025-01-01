import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_favorite/application/job_favorite/job_favorite_bloc.dart';
import 'package:flutter_bloc_favorite/job.dart';

class JobDetail extends StatelessWidget {
  const JobDetail({required this.job, super.key});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.title),
      ),
      body: BlocBuilder<JobFavoriteBloc, JobFavoriteState>(
        buildWhen: (previous, current) =>
            previous.favorites[job.id] != current.favorites[job.id],
        builder: (context, state) {
          final isFavorite = state.favorites[job.id] ?? false;
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            onPressed: () {
              context.read<JobFavoriteBloc>().add(ToggleFavoriteEvent(job));
            },
          );
        },
      ),
    );
  }
}
