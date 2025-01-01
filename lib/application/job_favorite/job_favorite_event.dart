part of 'job_favorite_bloc.dart';

abstract class JobFavoriteEvent {
  const JobFavoriteEvent();
}

class ToggleFavoriteEvent extends JobFavoriteEvent {
  final Job job;

  const ToggleFavoriteEvent(this.job);
}
