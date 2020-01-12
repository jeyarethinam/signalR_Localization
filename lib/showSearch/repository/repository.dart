import 'package:research_and_development_ondemand/showSearch/services/searchDto.dart';

class Repository {
  // final jobsProvider = TripsDto();
  final searchedmovies = SearchDto();
  // final locationProvider = GetLocationService();

  Future<dynamic> searchedMovie(String query) =>
      searchedmovies.getSearchedMovie(query);

  // Future<dynamic> getLocation() => locationProvider.initCurrentLocation();

  currentlocationProvider() {}
}
