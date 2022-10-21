import 'package:flutter/material.dart';
import 'package:movie_app/ui/Widgets/ListViews/cast_listview.dart';
import 'package:movie_app/ui/Widgets/loading.dart';
import 'package:movie_app/ui/Widgets/no_details.dart';
import 'package:movie_app/ui/Widgets/error_message.dart';

class CastFetcher extends StatefulWidget {
  final Future<dynamic> fetch;
  const CastFetcher(this.fetch, {super.key});

  @override
  State<CastFetcher> createState() => _CastFetcherState();
}

class _CastFetcherState extends State<CastFetcher> {
  List<dynamic> actors = [];

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: actors.isEmpty ? widget.fetch : null,
      builder: ((context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        if (snapShot.hasError) {
          return ErrorMessage(snapShot.error.toString());
        }
        actors = snapShot.data as List<dynamic>;
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
    );
  }
}
