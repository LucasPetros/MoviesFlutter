import 'package:movies/data/network/client/api_client.dart';
import 'package:movies/data/network/network_mapper.dart';
import 'package:movies/domain/model/movie.dart';

class MoviesRepository{
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  MoviesRepository({
    required this.apiClient,
    required this.networkMapper,
});

  Future<List<Movie>> getUpcomingMovies({
    required int limit,
    required int page,
}) async{
    final upcomingMovies =
        await apiClient.getUpcomingMovies(page: page,limit: limit);
    return networkMapper.toMovies(upcomingMovies.results);
  }
}
