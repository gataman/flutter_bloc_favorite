import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_favorite/application/job_favorite/job_favorite_bloc.dart';
import 'package:flutter_bloc_favorite/application/job_list/job_list_bloc.dart';
import 'package:flutter_bloc_favorite/job.dart';
import 'package:flutter_bloc_favorite/job_repository.dart';

class JobListWidget extends StatelessWidget {
  const JobListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobListBloc(
        const JobRepository(),
      )..add(JobListLoad()),
      child: BlocBuilder<JobListBloc, JobListState>(
        builder: (context, state) {
          if (state is JobListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is JobListLoaded) {
            return _JobListView(
              jobList: state.jobs,
            );
          } else {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
        },
      ),
    );
  }
}

//ANCHOR - JobListView
class _JobListView extends StatelessWidget {
  const _JobListView({
    required this.jobList,
    super.key,
  });
  final List<Job> jobList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobList.length,
      itemBuilder: (context, index) {
        final job = jobList[index];
        return _JobCard(job: job);
      },
    );
  }
}

//ANCHOR - JobCard
class _JobCard extends StatelessWidget {
  const _JobCard({
    super.key,
    required this.job,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/job_detail',
          arguments: job,
        );
      },
      child: ListTile(
        title: Text(job.title),
        subtitle: Text(job.description),
        trailing: BlocBuilder<JobFavoriteBloc, JobFavoriteState>(
          buildWhen: (previous, current) =>
              previous.favorites[job.id] != current.favorites[job.id],
          builder: (context, state) {
            debugPrint('Building favorite button for job ${job.id}');
            final isFavorite = state.favorites[job.id] ?? job.isFavorite;
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
      ),
    );
  }
}
