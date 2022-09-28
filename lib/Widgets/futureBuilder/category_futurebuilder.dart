import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/ListView/category_listview.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/Widgets/noData.dart';
import 'package:movie_app/mixins/data.dart';


class MoviesCategoryFutureBuilder extends StatefulWidget {
  final Future<dynamic> fetch;

  const MoviesCategoryFutureBuilder(this.fetch, {super.key});
  @override
  State<MoviesCategoryFutureBuilder> createState() => _MoviesCategoryFutureBuilderState();
}
class _MoviesCategoryFutureBuilderState extends State<MoviesCategoryFutureBuilder> with Data {
  

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

class TvsCategoryFutureBuilder extends StatefulWidget {
  final Future<dynamic> fetch;

  const TvsCategoryFutureBuilder(this.fetch, {super.key});
  @override
  State<TvsCategoryFutureBuilder> createState() => _TvsCategoryFutureBuilderState();
}
class _TvsCategoryFutureBuilderState extends State<TvsCategoryFutureBuilder> with Data {
  
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
