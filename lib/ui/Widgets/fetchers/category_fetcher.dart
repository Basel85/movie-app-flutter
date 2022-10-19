import 'package:flutter/material.dart';
import 'package:movie_app/statics/theme_mode_static.dart';
import 'package:movie_app/ui/Widgets/ListViews/category_listview.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/no_details.dart';
import 'package:movie_app/mixins/data.dart';
import 'package:movie_app/ui/Widgets/error_message.dart';

class MoviesCategoryFetcher extends StatefulWidget {
  final Future<dynamic> fetch;

  const MoviesCategoryFetcher(this.fetch, {super.key});
  @override
  State<MoviesCategoryFetcher> createState() => _MoviesCategoryFetcherState();
}

class _MoviesCategoryFetcherState extends State<MoviesCategoryFetcher>
    with Data {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("movie category rebuilt");
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
      builder: (context, snapShot) {
        print("aaa");
        if (snapShot.connectionState == ConnectionState.waiting) {
          print("zzz");
          return const Loading();
        }
        if (snapShot.hasError) {
          return ErrorMessage(snapShot.error.toString());
        }
        print("buildssss");
        undetailedData = snapShot.data as List<dynamic>;
        return undetailedData.isEmpty
            ? const NoDetails()
            : Container(
                margin: const EdgeInsets.only(left: 24),
                child: SizedBox(
                    height: 259, child: MoviesCategoryListView(undetailedData)),
              );
      },
      future: widget.fetch,
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
  bool currentMode = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print("tv category rebuilt");
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          currentMode = ThemeModeStatic.value;
          return const Loading();
        }
        if (snapShot.hasError) {
          return ErrorMessage(snapShot.error.toString());
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
      future: widget.fetch,
    );
  }
}
