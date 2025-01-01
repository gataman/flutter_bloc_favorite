import 'package:flutter_bloc_favorite/job.dart';

class JobRepository {
  const JobRepository();
  Future<List<Job>> getJobs() async {
    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));
    return [
      const Job(
        id: 1,
        title: 'Software Engineer',
        description: 'Develop software solutions',
        isFavorite: false,
      ),
      const Job(
        id: 2,
        title: 'Product Manager',
        description: 'Manage product development',
        isFavorite: true,
      ),
      const Job(
        id: 3,
        title: 'Quality Assurance Engineer',
        description: 'Ensure product quality',
        isFavorite: false,
      ),
      const Job(
        id: 4,
        title: 'Scrum Master',
        description: 'Lead agile teams',
        isFavorite: false,
      ),
      const Job(
        id: 5,
        title: 'Software Engineer',
        description: 'Develop software solutions',
        isFavorite: false,
      ),
      const Job(
        id: 6,
        title: 'Product Manager 2',
        description: 'Manage product development',
        isFavorite: false,
      ),
      const Job(
        id: 7,
        title: 'Quality Assurance 1',
        description: 'Ensure product quality',
        isFavorite: false,
      ),
    ];
  }
}
