import 'package:research_and_development_ondemand/showSearch/model/model.dart';
import 'package:research_and_development_ondemand/showSearch/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc {
  final _repository = Repository();
  final searchedList = PublishSubject<List<Movie>>();
  Observable<List<Movie>> get searchedMovies => searchedList.stream;

  fetchAllSearchedMovies(String query) async {
    List<Movie> movieModel = await _repository.searchedMovie(query);
    searchedList.sink.add(movieModel);
  }

  dispose() {
    searchedList.close();
  }
}

final searchBloc = SearchBloc();
