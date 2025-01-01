// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Job extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isFavorite;

  const Job({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  @override
  List<Object?> get props => [id, title, description, isFavorite];

  Job copyWith({
    int? id,
    String? title,
    String? description,
    bool? isFavorite,
  }) {
    return Job(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
