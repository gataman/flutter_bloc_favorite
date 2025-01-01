import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_favorite/job.dart';

part 'job_favorite_event.dart';
part 'job_favorite_state.dart';

class JobFavoriteBloc extends Bloc<JobFavoriteEvent, JobFavoriteState> {
  JobFavoriteBloc() : super(const JobFavoriteState(favorites: {})) {
    on<ToggleFavoriteEvent>(_toggleFavoriteEvent);
  }

  //ANCHOR - _toggleFavoriteEvent
  FutureOr<void> _toggleFavoriteEvent(event, emit) {
    final updatedFavorites = Map<int, bool>.from(state.favorites);

    updatedFavorites.update(
      event.job.id,
      (value) => !value,
      ifAbsent: () => !event.job.isFavorite,
    );
    emit(state.copyWith(favorites: updatedFavorites));
    debugPrint(
      'ToggleFavoriteEvent: ${state.favorites}',
    );
  }
}
