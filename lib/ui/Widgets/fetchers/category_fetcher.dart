import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/ListViews/category_listview.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/no_results.dart';
import 'package:movie_app/mixins/data.dart';
import 'package:movie_app/ui/Widgets/error_message.dart';

class MoviesCategoryFetcher extends StatefulWidget {
  final Future<dynamic> _fetch;

  const MoviesCategoryFetcher(this._fetch, {super.key});
  @override
  State<MoviesCategoryFetcher> createState() => _MoviesCategoryFetcherState();
}

class _MoviesCategoryFetcherState extends State<MoviesCategoryFetcher>
    with Data {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget._fetch,
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        if (snapShot.hasError) {
          return ErrorMessage(snapShot.error.toString());
        }
        undetailedData = snapShot.data as List<dynamic>;
        return undetailedData.isEmpty
            ? const NoResults()
            : Container(
                margin: const EdgeInsets.only(left: 24),
                child: SizedBox(
                    height: 259, child: MoviesCategoryListView(undetailedData)),
              );
      },
    );
  }
}

class TvsCategoryFetcher extends StatefulWidget {
  final Future<dynamic> fetch;

  const TvsCategoryFetcher(this.fetch, {super.key});
  @override
  State<TvsCategoryFetcher> createState() => _TvsCategoryFetcherState();
}

class _TvsCategoryFetcherState extends State<TvsCategoryFetcher> with Data {
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        if (snapShot.hasError) {
          return ErrorMessage(snapShot.error.toString());
        }
        undetailedData = snapShot.data as List<dynamic>;
        return undetailedData.isEmpty
            ? const NoResults()
            : Container(
                margin: const EdgeInsets.only(left: 24),
                child: SizedBox(
                    height: 259, child: TvsCategoryListView(undetailedData)),
              );
      },
      future: widget.fetch,
    );
  }
}
