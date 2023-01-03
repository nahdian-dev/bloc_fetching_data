import 'package:practice_fetching_api_bloc/data/models/jokes_model.dart';

import '../providers/jokes_provider.dart';

class JokesRepositories {
  final jokesProvider = JokesProvider();

  Future<JokesModel> fetchRandomJokes() => jokesProvider.getRandomJokes();
}
