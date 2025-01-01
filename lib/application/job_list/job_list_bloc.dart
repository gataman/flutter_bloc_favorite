import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_favorite/job.dart';
import 'package:flutter_bloc_favorite/job_repository.dart';

part 'job_list_event.dart';
part 'job_list_state.dart';

class JobListBloc extends Bloc<JobListEvent, JobListState> {
  JobListBloc(this._jobRepository) : super(JobListLoading()) {
    on<JobListLoad>(_onJobListLoad);
  }

  final JobRepository _jobRepository;

  FutureOr<void> _onJobListLoad(
      JobListLoad event, Emitter<JobListState> emit) async {
    final jobs = await _jobRepository.getJobs();

    emit(JobListLoaded(jobs));
  }
}
