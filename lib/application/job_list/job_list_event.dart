part of 'job_list_bloc.dart';

sealed class JobListEvent extends Equatable {
  const JobListEvent();

  @override
  List<Object> get props => [];
}

final class JobListLoad extends JobListEvent {}
