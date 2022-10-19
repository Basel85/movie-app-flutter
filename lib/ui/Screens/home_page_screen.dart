import 'package:flutter/material.dart';
import 'package:movie_app/data/repositories/movies_search_repository.dart';
import 'package:movie_app/ui/Widgets/ListViews/homepage_listview.dart';
import 'package:movie_app/ui/Widgets/builders/search_data_builder.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/error_message.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/providers/theme_mode_provider.dart';
import 'package:movie_app/statics/theme_mode_static.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("homePage built");
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text("Movie App", style: Theme.of(context).textTheme.subtitle2),
        actions: [
          Switch.adaptive(
            onChanged: (_) {
              Provider.of<Mode>(context, listen: false).changeMode();
            },
            value: ThemeModeStatic.value,
          ),
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: MySearchDelegate(context));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              ))
        ],
      ),
      body: const SafeArea(child: HomePageListView()),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

List<List<dynamic>> searchResults = [];
List<String> searchQueries = [];
List<dynamic> searchedData = [];
String prev = "";

class MySearchDelegate extends SearchDelegate {
  BuildContext _context;
  MySearchDelegate(this._context);
  @override
  String? get searchFieldLabel => "Search for a movie";
  @override
  InputDecorationTheme? get searchFieldDecorationTheme => InputDecorationTheme(
        hintStyle: Theme.of(_context).textTheme.bodyText1,
      );
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
          print(searchResults.length);
          print(searchQueries.length);
          if (searchResults.isNotEmpty) {
            searchResults.removeLast();
          }
          if (searchQueries.isNotEmpty) {
            searchQueries.removeLast();
          }
          if (searchResults.isEmpty && searchQueries.isEmpty) {
            searchedData = [];
            prev = '';
            query = '';
            return true;
          } else {
            prev = searchQueries.last;
            query = prev;
            searchedData = searchResults.last;
            buildResults(context);
          }
          return false;
        },
        child: IconButton(
          onPressed: () {
            print(searchResults.length);
            print(searchQueries.length);
            if (searchResults.isNotEmpty) {
              searchResults.removeLast();
            }
            if (searchQueries.isNotEmpty) {
              searchQueries.removeLast();
            }
            if (searchResults.isEmpty && searchQueries.isEmpty) {
              searchedData = [];
              prev = '';
              query = '';
              close(context, null);
            } else {
              prev = searchQueries.last;
              query = prev;
              searchedData = searchResults.last;
              buildResults(context);
            }
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
          print(prev);
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
                        if(searchedData.isNotEmpty){
                            searchResults.add(searchedData);
                            searchQueries.add(query);
                        }
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
