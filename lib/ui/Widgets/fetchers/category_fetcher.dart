import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/ListViews/category_listview.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/no_results.dart';
import 'package:movie_app/mixins/data.dart';
import 'package:movie_app/ui/Widgets/error_message.dart';

abstract class CategoryFetcher extends StatefulWidget {
  final Future<dynamic> fetch;
  Widget buildListView(undetailedData);

  const CategoryFetcher(this.fetch,{super.key});

  @override
  State<CategoryFetcher> createState() => _CategoryFetcherState();
}

class _CategoryFetcherState extends State<CategoryFetcher> with Data {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.fetch,
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
                    height: 259, child: widget.buildListView(undetailedData)),
              );
      },
    );
  }
}

class MoviesCategoryFetcher extends CategoryFetcher {
  const MoviesCategoryFetcher(super.fetch, {super.key});
  
  @override
  Widget buildListView(undetailedData) {
    return MoviesCategoryListView(undetailedData);
  }
}

class TvsCategoryFetcher extends CategoryFetcher {
  const TvsCategoryFetcher(super.fetch,{super.key});

  @override
  Widget buildListView(undetailedData) {
    return TvsCategoryListView(undetailedData);
  }
}
