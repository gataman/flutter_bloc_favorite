part of 'job_favorite_bloc.dart';

class JobFavoriteState extends Equatable {
  const JobFavoriteState({required this.favorites});
  final Map<int, bool> favorites;

  @override
  List<Object> get props => [favorites];

  JobFavoriteState copyWith({Map<int, bool>? favorites}) {
    return JobFavoriteState(
      favorites: favorites ?? this.favorites,
    );
  }
}
