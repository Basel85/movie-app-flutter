import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/ListView/category_listview.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/Widgets/noData.dart';
import 'package:movie_app/mixins/data.dart';

abstract class CategoryFutureBuilder extends StatelessWidget {
  final Future<dynamic> fetch;
  CategoryFutureBuilder(this.fetch, {super.key});

  @override
  Widget build(BuildContext context);
}

class MoviesCategoryFutureBuilder extends CategoryFutureBuilder {
  MoviesCategoryFutureBuilder(super.fetch, {super.key});
  List<dynamic> data = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        data = snapShot.data as List<dynamic>;
        return data.isEmpty
            ? const NoDetails()
            : Container(
                margin: const EdgeInsets.only(left: 24),
                child: SizedBox(
                    height: 259, child: MoviesCategoryListView(data)),
              );
      },
      future: data.isEmpty ? fetch : null,
    );
  }
}

class TvsCategoryFutureBuilder extends CategoryFutureBuilder {
  TvsCategoryFutureBuilder(super.fetch, {super.key});
  List<dynamic> data = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        data = snapShot.data as List<dynamic>;
        return data.isEmpty
            ? const NoDetails()
            : Container(
                margin: const EdgeInsets.only(left: 24),
                child: SizedBox(
                    height: 259, child: TvsCategoryListView(data)),
              );
      },
      future: data.isEmpty ? fetch : null,
    );
  }
}
