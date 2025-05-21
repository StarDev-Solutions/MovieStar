import 'package:frontend/src/authentication/domain/entities/movie.dart';
import 'package:frontend/src/base/enums/notifier_state.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MediaController extends GetxController {
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;

  List<Movie> _trendingMovies = [];
  List<Movie> get trendingMovies => _trendingMovies;

  Movie? _selectedMovie;
  Movie? get selectedMovie => _selectedMovie;
  
  void selectMovie(Movie movie) {
    _selectedMovie = movie;
  }
}