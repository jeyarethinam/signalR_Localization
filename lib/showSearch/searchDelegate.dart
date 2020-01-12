import 'package:flutter/material.dart';
import 'package:research_and_development_ondemand/showSearch/bloc/searchBloc.dart';
import 'package:research_and_development_ondemand/showSearch/model/model.dart';

class CustomerDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    query.length == 3
        ? searchBloc.fetchAllSearchedMovies(query)
        : Text("search Some think");

    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return StreamBuilder(
      stream: searchBloc.searchedMovies,
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text("No data!"));
        } else {
          if (snapshot.data.length < 0) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(snapshot.data[index].title);
            },
          );
        }
      },
    );
  }
}
