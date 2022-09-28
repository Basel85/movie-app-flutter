import 'package:flutter/material.dart';
import 'package:movie_app/Widgets/card/cast_card.dart';
import 'package:movie_app/Widgets/loading.dart';
import 'package:movie_app/Widgets/noData.dart';


class CastListView extends StatelessWidget {
  final Future<dynamic> fetch;
  CastListView(this.fetch, {super.key});

  List<dynamic> casts = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cast",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: 16,
          ),
          FutureBuilder(builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            }
            casts = snapshot.data as List<dynamic>;
            return casts.isEmpty
                ? const NoDetails()
                : Builder(builder: (context) {
                    return CastCard(casts.length, casts);
                  });
          }),future: casts.isEmpty?fetch:null,)
        ],
      ),
    );
  }
}
