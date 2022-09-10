import 'package:movie_app/data/models/undetailedMovie.dart';
import 'package:movie_app/providers/undetailedData_provider.dart';

class UnDetailedMovies extends UnDetailedData{
  @override
  void getData(result) {
    dataList = result["results"]
        .map((md) => UnDetailedMovie.fromJson(md))
        .toList();
  }
}
class UpcomingMovies extends UnDetailedMovies{}
class NowPlayingMovies extends UnDetailedMovies{}
class PopularMovies extends UnDetailedMovies{}