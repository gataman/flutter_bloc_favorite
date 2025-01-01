part of 'job_list_bloc.dart';

sealed class JobListState extends Equatable {
  const JobListState();

  @override
  List<Object> get props => [];
}

final class JobListLoading extends JobListState {}

final class JobListLoaded extends JobListState {
  final List<Job> jobs;

  const JobListLoaded(this.jobs);

  @override
  List<Object> get props => [jobs];
}
