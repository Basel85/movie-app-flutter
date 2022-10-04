import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/ListViews/cast_listview.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/no_details.dart';

class CastFetcher extends StatelessWidget {
  final Future<dynamic> fetch;
  CastFetcher(this.fetch, {super.key});

  List<dynamic> actors = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        actors = snapshot.data as List<dynamic>;
        return actors.isEmpty
            ? const NoDetails()
            : Builder(builder: (context) {
                return Container(
                  height: 260,
                  padding: EdgeInsets.zero,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: CastListView(actors),
                );
              });
      }),
      future: actors.isEmpty ? fetch : null,
    );
  }
}
