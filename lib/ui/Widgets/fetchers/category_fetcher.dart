import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/ListViews/category_listview.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/no_details.dart';
import 'package:movie_app/mixins/data.dart';


class MoviesCategoryFetcher extends StatefulWidget {
  final Future<dynamic> fetch;

  const MoviesCategoryFetcher(this.fetch, {super.key});
  @override
  State<MoviesCategoryFetcher> createState() => _MoviesCategoryFetcherState();
}
class _MoviesCategoryFetcherState extends State<MoviesCategoryFetcher> with Data {
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        undetailedData = snapShot.data as List<dynamic>;
        return undetailedData.isEmpty
            ? const NoDetails()
            : Container(
                margin: const EdgeInsets.only(left: 24),
                child: SizedBox(
                    height: 259, child: MoviesCategoryListView(undetailedData)),
              );
      },
      future: undetailedData.isEmpty ? widget.fetch : null,
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
        undetailedData = snapShot.data as List<dynamic>;
        return undetailedData.isEmpty
            ? const NoDetails()
            : Container(
                margin: const EdgeInsets.only(left: 24),
                child: SizedBox(
                    height: 259, child: TvsCategoryListView(undetailedData)),
              );
      },
      future: undetailedData.isEmpty ? widget.fetch : null,
    );
  }
}
