import 'package:flutter/material.dart';
import 'package:movie_app/data/repositories/cast_repository.dart';
import 'package:movie_app/ui/Widgets/fetchers/cast_fetcher.dart';

class CastBuilder extends StatelessWidget {
  final _dataId;
  const CastBuilder(this._dataId,{super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, top: 24,right: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Cast",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          const SizedBox(
            height: 16,
          ),
          CastFetcher(CastRepository.fetch(_dataId, "movie")),
        ]));
  }
}
