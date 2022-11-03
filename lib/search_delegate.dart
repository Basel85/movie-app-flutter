import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/builders/search_data_builder.dart';
import 'package:movie_app/ui/Widgets/error_message.dart';
import 'data/repositories/movies_search_repository.dart';
import 'ui/Widgets/loading.dart';

List<dynamic> searchedData = [];
String prev = "";

class MySearchDelegate extends SearchDelegate<String?> {
  BuildContext _context;
  MySearchDelegate(this._context);
  @override
  String? get searchFieldLabel => "Search for a movie";
  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        hintStyle: Theme.of(_context).textTheme.bodyText1,
      );
  @override
  TextStyle? get searchFieldStyle => Theme.of(_context).textTheme.bodyText2;
  @override
  List<Widget>? buildActions(BuildContext context) => [
        query.isNotEmpty
            ? IconButton(
                onPressed: () {
                  query = '';
                },
                icon: const Icon(Icons.clear))
            : Container(),
      ];

  @override
  Widget? buildLeading(BuildContext context) => WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      );
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 0),
      child: Builder(
        builder: (context) {
          return query.isNotEmpty
              ? prev.trim() != query.trim()
                  ? FutureBuilder(
                      future: SearchedMoviesRepository.fetch(query),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return const Loading();
                        }
                        if (snapShot.hasError) {
                          return ErrorMessage(snapShot.error.toString());
                        }
                        prev = query;
                        searchedData = snapShot.data as List<dynamic>;
                        return SearchDataBuilder(searchedData);
                      })
                  : SearchDataBuilder(searchedData)
              : Container();
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
